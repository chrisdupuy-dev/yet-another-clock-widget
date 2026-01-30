import QtQuick 2.0

import org.kde.plasma.configuration 2.0

ConfigModel {
    ConfigCategory {
        name: i18n("Global Appearance")
        icon: "preferences-desktop-color"
        source: "configGlobal.qml"
    }

    ConfigCategory {
        name: i18n("Time Appearance")
        icon: "preferences-desktop-color"
        source: "configTime.qml"
    }

    ConfigCategory {
        name: i18n("Date Appearance")
        icon: "preferences-desktop-color"
        source: "configDate.qml"
    }
}
