/****************************************************************************
**
** Copyright (C) 2017 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.15
import QtQml 2.15
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.0
import QtQuick.Controls.Material 2.12
import VLCQt 1.0

ApplicationWindow {
    id: window

    width: 1280
    height: 720

    visible: true

    flags: Qt.Window| Qt.CustomizeWindowHint  | Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint

    //    Component.onCompleted: {
    //        x = Screen.width / 2 - width / 2
    //        y = Screen.height / 2 - height / 2
    //    }


    FramelessWindowDragger {
        id: dragger

        anchors.fill: window.contentItem

        target: window

        ParentAnimation {
            NumberAnimation {
                target: window
                property: "x"
                duration: 30
            }
            NumberAnimation {
                target: window
                property: "y"
                duration: 30
            }
        }
    }

    Shortcut {
        sequence: "Ctrl+Q"
        onActivated: Qt.quit()
    }

    header: ToolBar {
        id: toolbar
        RowLayout {
            id: headerRowLayout
            anchors.fill: parent
            spacing: 0

            ToolButton {
                icon.name: "grid"
            }
            ToolButton {
                icon.name: "settings"
            }
            ToolButton {
                icon.name: "filter"
            }
            ToolButton {
                icon.name: "message"
            }
            ToolButton {
                icon.name: "music"
            }
            ToolButton {
                icon.name: "cloud"
            }
            ToolButton {
                icon.name: "bluetooth"
            }
            ToolButton {
                icon.name: "cart"
            }

            Item {
                Layout.fillWidth: true
            }

            ToolButton {
                icon.name: "power"
                onClicked: Qt.quit()
            }
        }
    }

    Label {
        text: "VLC视频播放器(Qt)2.0"
        //        Material.foreground: Material.Grey
        font.bold: true
        font.pixelSize: Qt.application.font.pixelSize * 2
        anchors.centerIn: header
        z: header.z + 1
    }

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 4
        anchors.rightMargin: 4

        ColumnLayout {
            //            spacing: 26
            Layout.preferredWidth: 230

            Rectangle {
                color: "black"
                Layout.fillWidth: true
                Layout.fillHeight: true

                VlcVideoPlayer {
                    id: videoPlayer
                    anchors.fill: parent
                    url: "http://vfx.mtime.cn/Video/2019/03/18/mp4/190318231014076505.mp4"
                    property url lastUrl: "http://vfx.mtime.cn/Video/2019/03/18/mp4/190318231014076505.mp4"
                }

            }

            Item {
                id: songLabelContainer
                clip: true

                Layout.fillWidth: true
                Layout.preferredHeight: songNameLabel.implicitHeight

                SequentialAnimation {
                    running: true
                    loops: Animation.Infinite

                    PauseAnimation {
                        duration: 2000
                    }
                    ParallelAnimation {
                        XAnimator {
                            target: songNameLabel
                            from: 0
                            to: songLabelContainer.width - songNameLabel.implicitWidth
                            duration: 5000
                        }
                        OpacityAnimator {
                            target: leftGradient
                            from: 0
                            to: 1
                        }
                    }
                    OpacityAnimator {
                        target: rightGradient
                        from: 1
                        to: 0
                    }
                    PauseAnimation {
                        duration: 1000
                    }
                    OpacityAnimator {
                        target: rightGradient
                        from: 0
                        to: 1
                    }
                    ParallelAnimation {
                        XAnimator {
                            target: songNameLabel
                            from: songLabelContainer.width - songNameLabel.implicitWidth
                            to: 0
                            duration: 5000
                        }
                        OpacityAnimator {
                            target: leftGradient
                            from: 0
                            to: 1
                        }
                    }
                    OpacityAnimator {
                        target: leftGradient
                        from: 1
                        to: 0
                    }
                }

                Rectangle {
                    id: leftGradient
                    gradient: Gradient {
                        GradientStop {
                            position: 0
                            color: "#dfe4ea"
                        }
                        GradientStop {
                            position: 1
                            color: "#00dfe4ea"
                        }
                    }

                    width: height
                    height: parent.height
                    anchors.left: parent.left
                    z: 1
                    rotation: -90
                    opacity: 0
                }

                Label {
                    id: songNameLabel
                    //                    text: "Edvard Grieg - In the Hall of the Mountain King"
                    text: "《叶问4：完结篇》"
                    font.pixelSize: Qt.application.font.pixelSize * 1.4
                }

                Rectangle {
                    id: rightGradient
                    gradient: Gradient {
                        GradientStop {
                            position: 0
                            color: "#00dfe4ea"
                        }
                        GradientStop {
                            position: 1
                            color: "#dfe4ea"
                        }
                    }

                    width: height
                    height: parent.height
                    anchors.right: parent.right
                    rotation: -90
                }
            }

            RowLayout {
                spacing: 8
                Layout.alignment: Qt.AlignHCenter

                RoundButton {
                    icon.name: "favorite"
                    icon.width: 32
                    icon.height: 32
                }
                RoundButton {
                    icon.name: "stop"
                    icon.width: 32
                    icon.height: 32
                    onClicked: {
                        videoPlayer.stop()
                    }
                }
                RoundButton {
                    icon.name: "previous"
                    icon.width: 32
                    icon.height: 32
                }
                RoundButton {
                    Material.elevation: 6
                    icon.name: videoPlayer.state === 3 ? "pause" : "play"
                    icon.width: 48
                    icon.height: 48
                    onClicked: {
                        if (videoPlayer.state === 3)
                            videoPlayer.pause()
                        else if (videoPlayer.state === 4)
                            videoPlayer.play()
                        else
                            videoPlayer.url = videoPlayer.lastUrl
                    }
                }
                RoundButton {
                    icon.name: "next"
                    icon.width: 32
                    icon.height: 32
                }
                RoundButton {
                    icon.name: "repeat"
                    icon.width: 32
                    icon.height: 32
                }
                RoundButton {
                    icon.name: "shuffle"
                    icon.width: 32
                    icon.height: 32
                }
            }



            Slider {
                id: seekSlider
                from: 0
                to: Math.floor(videoPlayer.length / 1000)

                CheckBox {
                    id: checkBox
                    checkable: true
                    checked: true
                    text: "显示章节"
                    anchors.right: parent.right
                    anchors.bottom: parent.verticalCenter
                }

                PlayerSliderMarker {
                    id: sliderMarker
                    visible: checkBox.checked
                    markersModel: ListModel {
                        ListElement {
                            title: "第一章 我是个练武之人"
                            begin: .01
                            end: .18
                        }
                        ListElement {
                            title: "第二章 佛山无影掌"
                            begin: .20
                            end: .5
                        }

                        ListElement {
                            title: "第三章 我要打十个"
                            begin: .6
                            end: .99
                        }
                    }
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    //        anchors.verticalCenterOffset: -10
                }

                Binding on value{
                    delayed: true
                    restoreMode: Binding.RestoreNone
                    when: !seekSlider.pressed
                    value: videoPlayer.time / 1000
                }

                onPressedChanged: {
                    if (!pressed) {
                        videoPlayer.position = seekSlider.position
                    }
                }

                Layout.fillWidth: true

                function pad(number) {
                    if (number <= 9)
                        return "0" + number;
                    return number;
                }

                readonly property string curTime: pad(Math.floor(value / 60)) + ":" + pad(Math.floor(value % 60))
                readonly property string totalTime: pad(Math.floor(to / 60)) + ":" + pad(Math.floor(to % 60))
                readonly property string sliderTime: pad(Math.floor(value / 60)) + ":" + pad(Math.floor(value % 60))

                Label {
                    x: (seekSlider.width - width) * .5
                    y: 0
                    visible: true//seekSlider.pressed
                    text: seekSlider.curTime + "/" + seekSlider.totalTime
                }

                ToolTip {
                    parent: seekSlider.handle
                    visible: seekSlider.pressed
                    text: seekSlider.sliderTime
                    y: parent.height
                }
            }
        }

    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}
}
##^##*/
