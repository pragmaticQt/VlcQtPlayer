import QtQuick 2.0

MouseArea {
    required property var target
    property int previousX
    property int previousY
    anchors.fill: parent

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
