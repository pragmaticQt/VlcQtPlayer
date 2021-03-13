import QtQuick 2.0

FramelessWindowHelper {
//    anchors.fill: parent

    onPressed: {
        previousX = mouseX
        previousY = mouseY
    }

    onMouseXChanged: {
        var dx = mouseX - previousX
        target.x += dx
    }

    onMouseYChanged: {
        var dy = mouseY - previousY
        target.y += dy
    }
}
