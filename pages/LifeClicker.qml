import QtQuick 1.1

MouseArea {
    width: parent.width
    height: parent.height
    property int lifeloss
    property variant target

    onClicked: {
        lifetimer.stop()
        lifetimer.restart()
        lifetimer.lifetotal = lifetimer.lifetotal + lifeloss
        var op = ""
        if (lifetimer.lifetotal > 0) {
            op = "+"
        } else {
            op = ""
        }
        var hpstr = target.hp + " (" + op + lifetimer.lifetotal + ")"
        target.remove(target.count - 1)
        target.set(target.count, {number: hpstr})
    }
}
