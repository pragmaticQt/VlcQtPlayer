TEMPLATE = app
TARGET = VlcQtPlayer
QT += quick quickcontrols2

SOURCES += \
    VlcQtPlayer.cpp

RESOURCES += \
    icons/icons.qrc \
    images/album-cover.jpg \
    imagine-assets/imagine-assets.qrc \
    qml.qrc \
    qtquickcontrols2.conf

RC_ICONS = app.ico

INCLUDEPATH += "C:/Program Files/VLC-Qt/include"
LIBS += -L"C:/Program Files/VLC-Qt/lib" -lVLCQtCore -lVLCQtQml

QML_IMPORT_PATH += "C:/Program Files/VLC-Qt/qml"

target.path = $$[QT_INSTALL_EXAMPLES]/quickcontrols2/imagine/musicplayer
INSTALLS += target

DISTFILES +=
