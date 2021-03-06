import QtQuick 2.0
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0

InteractiveArea {
    id: item1
    width: 200
    height: 200
    clip: false
    hoverColor: "#00ffffff"
    property alias imageSource : img.source

    onEntered: {
        glowEffect.visible = true;
    }

    onExited: {
        glowEffect.visible = false;
    }

    Glow {
        id: glowEffect
        visible: false
        anchors.fill: mask
        radius: 15
        transparentBorder: true
        samples: 17
        color: "#66808080"
        source: mask
    }

    Rectangle {
        id: mask
        width: 150
        height: 150
        radius: 75
        anchors.horizontalCenter: parent.horizontalCenter
        visible: false
    }

    Image {
        id: img
        source: 'img/avatar.png'
        width: 150
        height: 150
        anchors.horizontalCenter: parent.horizontalCenter
        fillMode: Image.PreserveAspectCrop
        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: mask
        }
    }

    MouseArea {
        id: mouseArea
        hoverEnabled: true
        anchors.fill: parent

        onEntered: {
            onShow.start()
        }

        onExited: {
            onHide.start()
        }

        NumberAnimation {
            id: onShow
            target: buttonContainer
            properties: "opacity, scale"
            to: 1.0
            duration: 50
        }

        NumberAnimation {
            id: onHide
            target: buttonContainer
            properties: "opacity, scale"
            to: 0.0
            duration: 50
        }

        Item{
            id: buttonContainer
            anchors.fill: parent
            opacity: 0

            CircleButton {
                id: playBtn
                width: 50
                height: 50
                bgColor: "#d5cfcf"
                anchors.left: parent.left
                anchors.leftMargin: 45
                anchors.top: parent.top
                anchors.topMargin: 50
                imageSource: "img/play.png"
            }

            CircleButton {
                id: addPlayList
                width: 50
                height: 50
                bgColor: "#d5cfcf"
                anchors.right: parent.right
                anchors.rightMargin: 45
                anchors.top: parent.top
                anchors.topMargin: 50
                imageSource: "img/plus.png"
            }
        }

    }

    Text {
        id: text1
        text: qsTr("Various Aritists")
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 15
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 18
    }

}

