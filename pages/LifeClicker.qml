import QtQuick 1.1

MouseArea {
    width: parent.width
    height: parent.height
    property int lifeloss
    property variant target
    Timer {
        id: lifetimer
        interval: 500
        property int lifetotal: 0
        onTriggered: {
            var hpstr = target.hp + " (" + lifetotal + ")"
            target.totalpoints = target.hp + lifetotal
            target.hp = target.hp + lifetotal
            target.append({number: target.totalpoints})
            lifetotal = 0
        }
    }

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
        console.log(target.count)
        target.set(target.count, {number: hpstr})
    }
}
