import QtQuick 2.0

MouseArea {
    required property var target
    property int previousX
    property int previousY

    width: 5
    height: 5

    anchors {
        right: parent.right
        bottom: parent.bottom
    }
    // We set the shape of the cursor so that it is clear that this resizing
    cursorShape: Qt.SizeFDiagCursor

    onPressed: {
        previousX = mouseX
        previousY = mouseY
    }

    onMouseYChanged: {
        var dy = mouseY - previousY
        target.height += dy
    }
    onMouseXChanged: {
        var dx = mouseX - previousX
        target.width += dx
    }
}
