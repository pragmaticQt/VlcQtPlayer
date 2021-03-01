TEMPLATE = app
TARGET = musicplayer
QT += quick quickcontrols2

SOURCES += \
    musicplayer.cpp

RESOURCES += \
    icons/icons.qrc \
    images/album-cover.jpg \
    imagine-assets/imagine-assets.qrc \
    qml.qrc \
    qtquickcontrols2.conf

RC_ICONS = music.ico

target.path = $$[QT_INSTALL_EXAMPLES]/quickcontrols2/imagine/musicplayer
INSTALLS += target

DISTFILES += \
    ItemDragger.qml \
    ItemResizer.qml
