
CONFIG += qt cascades10
QT += network
INCLUDEPATH += ../src
SOURCES += ../src/*.cpp
HEADERS += ../src/*.hpp ../src/*.h
LIBS += -lbbsystem

lupdate_inclusion {
    SOURCES += ../assets/*.qml
}

TRANSLATIONS = \
    $${TARGET}_en_GB.ts \
    $${TARGET}_fr.ts \
    $${TARGET}_it.ts \    
    $${TARGET}_de.ts \
    $${TARGET}_es.ts \
    $${TARGET}_zh_TW.ts \
    $${TARGET}.ts

