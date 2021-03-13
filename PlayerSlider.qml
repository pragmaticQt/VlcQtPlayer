import QtQuick 2.15
import QtQuick.Controls 2.12

Slider {

    id: slider

    implicitWidth: 500
    implicitHeight: 60

    property alias showSliderMaker: sliderMarker.visible
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

//    MouseArea {
//        anchors.fill: slider.background
//        onClicked: {
//            mouse.accepted = true
//            slider.value = mouse.x / slider.width
//            console.log("Slider: "+mouse.x+","+mouse.y)
//        }
//    }

    PlayerSliderMarker {
        id: sliderMarker
        visible: true
        markersModel: markersModel
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        //        anchors.verticalCenterOffset: -10
    }

}
