import QtQuick 2.15
import QtQuick.Controls 2.15 as QQC2
import SddmComponents 2.0

Rectangle {
    id: root
    width: 1920
    height: 1080
    color: "#111111"

    readonly property color accent: "#e6a817"
    readonly property color textColor: "#e4ded2"
    readonly property color mutedText: "#aaa294"
    readonly property string fontName: config.stringValue("font") || "JetBrainsMono Nerd Font"
    readonly property int usernameRole: Qt.UserRole + 1
    property int userIndex: userModel.lastIndex
    property int sessionIndex: sessionModel.lastIndex
    property string batteryText: "BAT  --"
    property string wifiText: "WIFI  checking"
    property string hostText: "HOST  --"
    property string loginError: ""
    property date now: new Date()

    function readFile(path, callback) {
        var request = new XMLHttpRequest()
        request.onreadystatechange = function() {
            if (request.readyState === XMLHttpRequest.DONE)
                callback(request.status === 0 || request.status === 200 ? request.responseText.trim() : "")
        }
        request.open("GET", "file://" + path)
        request.send()
    }

    function updateBattery() {
        readFile("/sys/class/power_supply/BAT0/capacity", function(capacity) {
            readFile("/sys/class/power_supply/BAT0/status", function(status) {
                if (capacity === "") {
                    batteryText = "BAT  unavailable"
                    return
                }
                var state = status === "Charging" ? "charging" : status === "Full" ? "full" : "remaining"
                batteryText = "BAT  " + capacity + "%  " + state
            })
        })
    }

    function updateWifi() {
        readFile("/sys/class/net/wlan0/operstate", function(state) {
            if (state !== "up") {
                wifiText = "WIFI  offline"
                return
            }
            readFile("/proc/net/wireless", function(data) {
                var match = data.match(/wlan0:\s+\d+\s+([\d.]+)/)
                var quality = match ? Math.min(100, Math.round(parseFloat(match[1]) / 70 * 100)) : 100
                wifiText = "WIFI  connected  " + quality + "%"
            })
        })
    }

    function updateHost() {
        readFile("/etc/hostname", function(hostname) {
            hostText = "HOST  " + (hostname === "" ? "unknown" : hostname)
        })
    }

    function login() {
        if (password.text !== "") {
            loginError = ""
            sddm.login(userModel.data(userModel.index(userIndex, 0), usernameRole), password.text, sessionIndex)
        }
    }

    Image {
        anchors.fill: parent
        source: config.stringValue("background")
        fillMode: Image.PreserveAspectCrop
        asynchronous: true
        cache: true
    }

    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 44
        spacing: 2

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: Qt.formatTime(root.now, "HH:mm")
            color: root.textColor
            font.family: root.fontName
            font.pixelSize: 52
            font.weight: Font.Medium
            style: Text.Raised
            styleColor: "#88000000"
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: Qt.formatDate(root.now, "dddd, dd MMMM")
            color: root.accent
            font.family: root.fontName
            font.pixelSize: 15
        }
    }

    Column {
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 42
        anchors.topMargin: 38
        spacing: 8

        Text {
            anchors.right: parent.right
            text: root.batteryText
            color: root.mutedText
            font.family: root.fontName
            font.pixelSize: 14
        }

        Text {
            anchors.right: parent.right
            text: root.wifiText
            color: root.mutedText
            font.family: root.fontName
            font.pixelSize: 14
        }

        Text {
            anchors.right: parent.right
            text: root.hostText
            color: "#7f796f"
            font.family: root.fontName
            font.pixelSize: 14
        }
    }

    Rectangle {
        width: 430
        height: 144
        color: "transparent"
        anchors.centerIn: parent
        anchors.verticalCenterOffset: 245

        Column {
            anchors.fill: parent
            spacing: 14

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: userModel.data(userModel.index(root.userIndex, 0), root.usernameRole)
                color: root.accent
                font.family: root.fontName
                font.pixelSize: 22
                font.weight: Font.Medium
            }

            QQC2.TextField {
                id: password
                width: parent.width
                height: 54
                focus: true
                echoMode: TextInput.Password
                passwordCharacter: "*"
                placeholderText: "Enter Password"
                horizontalAlignment: TextInput.AlignHCenter
                color: root.textColor
                placeholderTextColor: root.mutedText
                font.family: root.fontName
                font.pixelSize: 17
                selectByMouse: true
                onAccepted: root.login()

                background: Rectangle {
                    radius: 8
                    color: "#cc111111"
                    border.width: 1
                    border.color: password.activeFocus ? root.accent : "#66666666"
                }
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: root.loginError
                color: "#f38ba8"
                font.family: root.fontName
                font.pixelSize: 13
            }
        }
    }

    Row {
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 48
        anchors.bottomMargin: 36
        spacing: 8

        QQC2.Button {
            text: "Suspend"
            flat: true
            palette.buttonText: root.mutedText
            visible: sddm.canSuspend
            onClicked: sddm.suspend()
        }
        QQC2.Button {
            text: "Restart"
            flat: true
            palette.buttonText: root.mutedText
            visible: sddm.canReboot
            onClicked: sddm.reboot()
        }
        QQC2.Button {
            text: "Power off"
            flat: true
            palette.buttonText: root.mutedText
            visible: sddm.canPowerOff
            onClicked: sddm.powerOff()
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: root.now = new Date()
    }

    Timer {
        interval: 5000
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            root.updateBattery()
            root.updateWifi()
            root.updateHost()
        }
    }

    Connections {
        target: sddm
        function onLoginFailed() {
            root.loginError = "Incorrect password"
            password.clear()
            password.forceActiveFocus()
        }
    }

    Component.onCompleted: password.forceActiveFocus()
}
