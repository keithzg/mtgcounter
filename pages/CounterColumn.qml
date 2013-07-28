import QtQuick 1.1
import Sailfish.Silica 1.0

Column {
    width: parent.width / 2
    property alias playername: playerlabel.text
    property alias hitpoint: hitpoints.text
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
        height: 50
        color: "black"
        border.width: 1
        border.color: "white"
        z: 5
        Label {
            property int hitpoints: 20
            id: hitpoints
            text: "20"
        }
    }
    Rectangle {
        id: hprect
        width: parent.width
        height: 450
        z: 3
        color: "black"
        border.width: 1
        border.color: "white"
        SilicaListView {
            height: 450
            width: parent.width
            model: ListModel {
                id: pointsmeter
                property int hp: 20
                property alias totalpoints: hitpoints.text
                property int prevchild: hprect.top
            }
            delegate: BackgroundItem {
                width: ListView.view.width
                height: 35
                Label {
                    id: points
                    horizontalAlignment: Text.AlignHCenter
                    text: number
                }
            }
        }
    }
    Rectangle {
        property int commonwidth: 50
        property int commonheight: 35
        width: parent.width
        height: 250
        color: "black"
        border.color: "white"
        border.width: 1
        Rectangle {
            id: minusone
            color: "grey"
            height: parent.commonheight
            width: parent.commonwidth
            anchors.left: parent.left
            Label {
                text: "-1"
                horizontalAlignment: Text.AlignHCenter
            }
            LifeClicker {
                lifeloss: -1
                target: pointsmeter
            }
        }
        Rectangle {
            color: "grey"
            width: parent.commonwidth
            height: parent.commonheight
            anchors.left: parent.left
            anchors.top: minusone.bottom
            Label {
                text: "+1"
            }
            LifeClicker {
                lifeloss: 1
                target: pointsmeter
            }
        }
        Rectangle {
            color: "grey"
            width: parent.commonwidth
            height: parent.commonheight
            anchors.right: parent.right
            id: minusfive
            Label {
                text: "-5"
            }
            LifeClicker {
                lifeloss: -5
                target: pointsmeter
            }
        }
        Rectangle {
            color: "grey"
            width: parent.commonwidth
            height: parent.commonheight
            anchors.top: minusfive.bottom
            anchors.right: parent.right
            Label {
                text: "+5"
            }
            LifeClicker {
                lifeloss: 5
                target: pointsmeter
            }
        }
    }
}
