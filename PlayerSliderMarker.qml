
import QtQuick 2.15
import QtQuick.Controls 2.12

Control {
    id: control

    property color markColor: "green"
    property var markersModel: ListModel {
        ListElement {
            title: "Text 1"
            begin: .15
            end: .35
        }
        ListElement {
            title: "Text 2"
            begin: .45
            end: .65
        }

        ListElement {
            title: "Text 3"
            begin: .7
            end: .85
        }
    }

    signal posClicked(real logicPos/* 0.0 to 1.0 */)

    implicitWidth: 600
    implicitHeight: 60

    Row {
        anchors.fill: parent
        Repeater {
            model: markersModel
            delegate: Item {
                required property real begin
                required property real end
                required property string title

                Rectangle {
                    id: leftMarker
                    x: control.leftPadding + begin * (control.availableWidth - width)
                    y: control.topPadding + .5 * (control.availableHeight - height)
                    implicitWidth: 6
                    implicitHeight: 26
                    //        radius: 13
                    color: control.markColor
                }

                MouseArea {
                    id: mouseArea
                    anchors.fill: centerMarker
                    hoverEnabled: true
                    propagateComposedEvents: true
                    onClicked: {
                        console.log("SliderMarker: "+mouse.x+","+mouse.y)
                        control.posClicked(begin)
                        mouse.accepted = false
                    }
                }
                Rectangle {
                    id: centerMarker
                    anchors.verticalCenter: leftMarker.verticalCenter
                    anchors.left: leftMarker.right
                    anchors.right: rightMarker.left
                    height: mouseArea.containsMouse ? 10 : 5
                    color: control.markColor
                }
                Text {
                    visible: mouseArea.containsMouse
                    anchors.horizontalCenter: centerMarker.horizontalCenter
                    anchors.bottom: centerMarker.top
                    font.pixelSize: 20
                    text: title
                    color: "white"
                }
                Rectangle {
                    id: rightMarker
                    x: control.leftPadding + end * (control.availableWidth - width)
                    y: control.topPadding + .5 * (control.availableHeight - height)
                    implicitWidth: 6
                    implicitHeight: 26
                    //        radius: 13
                    color: control.markColor
                }
            }
        }
    }
}
