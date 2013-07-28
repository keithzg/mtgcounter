import QtQuick 1.1

Rectangle {
    property alias text: dectlabl.text
    property alias lifeloss: dectcl.lifeloss
    color: "grey"
    width: parent.commonwidth
    height: parent.commonheight
    border.color: "white"
    border.width: 1
    anchors.topMargin: 15
    anchors.leftMargin: 30
    DeductLabel {
        id: dectlabl
    }
    LifeClicker {
        id: dectcl
        target: pointsmeter
    }
}
