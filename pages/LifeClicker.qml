import QtQuick 2.0

MouseArea {
    width: parent.width
    height: parent.height
    property int lifeloss

    onClicked: {
        onDeductClicked(lifeloss)
    }
}
