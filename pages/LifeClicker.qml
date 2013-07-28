import QtQuick 1.1

MouseArea {
    width: parent.width
    height: parent.height
    property int lifeloss

    onClicked: {
        onDeductClicked(lifeloss)
    }
}
