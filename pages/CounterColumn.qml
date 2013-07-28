import QtQuick 1.1
import Sailfish.Silica 1.0

Column {
    width: parent.width / 2
    property alias playername: playerlabel.text
    property alias hitpoint: hitpoints.text
    function clear() {
        pointsmeter.clear()
        hitpoints.hitpoints = 20
        hitpoints.text = "20"
        pointsmeter.hp = 20
        pointsmeter.totalpoints = "20"
    }

    Rectangle {
        width: parent.width
        height: 35
        color: "black"
        border.width: 1
        border.color: "white"
        z: 5
        Label {
            id: playerlabel
            text: "Me"
        }
    }
    Rectangle {
        width: parent.width
        height: 70
        color: "black"
        border.width: 1
        border.color: "white"
        z: 5
        Label {
            property int hitpoints: 20
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: theme.fontSizeExtraLarge
            id: hitpoints
            text: "20"
        }
    }
    Rectangle {
        id: hprect
        width: parent.width
        height: 530
        z: 3
        color: "black"
        border.width: 1
        border.color: "white"
        SilicaListView {
            id: lifeview
            height: 550
            width: parent.width
            model: ListModel {
                id: pointsmeter
                property int hp: 20
                property alias totalpoints: hitpoints.text
            }
            delegate: BackgroundItem {
                width: ListView.view.width
                height: 35
                Label {
                    id: points
                    anchors.horizontalCenter: parent.horizontalCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: theme.fontSizeMedium
                    text: number
                }
            }
        }
    }
    function onDeductClicked(lifeloss) {
        lifetimer.stop()
        lifetimer.restart()
        lifetimer.lifetotal = lifetimer.lifetotal + lifeloss
        var op = ""
        if (lifetimer.lifetotal > 0) {
            op = "+"
        } else {
            op = ""
        }
        var hpstr = pointsmeter.hp + " (" + op + lifetimer.lifetotal + ")"
        pointsmeter.remove(pointsmeter.count - 1)
        pointsmeter.set(pointsmeter.count, {number: hpstr})
    }

    Timer {
        id: lifetimer
        interval: 700
        property int lifetotal: 0
        onTriggered: {
            var hpstr = pointsmeter.hp + " (" + lifetotal + ")"
            pointsmeter.totalpoints = pointsmeter.hp + lifetotal
            pointsmeter.hp = pointsmeter.hp + lifetotal
            pointsmeter.append({number: pointsmeter.totalpoints})
            lifetotal = 0
            lifeview.positionViewAtEnd()
        }
    }
    Rectangle {
        property int commonwidth: 85
        property int commonheight: 85
        width: parent.width
        height: 250
        color: "black"
        border.color: "white"
        border.width: 1
        z: 5
        DeductButton {
            text: "-1"
            id: minusone
            anchors.top: parent.top
            anchors.left: parent.left
            lifeloss: -1
        }

        DeductButton {
            text: "+1"
            anchors.top: minusone.bottom
            anchors.left: parent.left
            lifeloss: 1
        }

        DeductButton {
            id: minusfive
            anchors.top: parent.top
            anchors.right: parent.right
            text: "-5"
            lifeloss: -5
        }
        DeductButton {
            anchors.top: minusfive.bottom
            anchors.right: parent.right
            text: "+5"
            lifeloss: 5
        }
    }
}
