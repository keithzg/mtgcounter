import QtQuick 1.1
import Sailfish.Silica 1.0

Button {
    property alias text: dectlabl.text
    property alias lifeloss: dectcl.lifeloss
    smooth: true
    width: parent.commonwidth
    height: parent.commonheight
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
