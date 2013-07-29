import QtQuick 1.1

Rectangle {
    property alias text: dectlabl.text
    property alias lifeloss: dectcl.lifeloss
    color: theme.highlightBackgroundColor
    smooth: true
    width: parent.commonwidth
    height: parent.commonheight
    border.color: "white"
    border.width: 1
    anchors.topMargin: 15
    anchors.leftMargin: 15
    anchors.rightMargin: 15
    DeductLabel {
        id: dectlabl
    }
    LifeClicker {
        id: dectcl
    }
}
