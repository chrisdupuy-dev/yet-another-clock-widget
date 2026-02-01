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
        icon: "clock"
        source: "configTime.qml"
    }

    ConfigCategory {
        name: i18n("Date Appearance")
        icon: "date"
        source: "configDate.qml"
    }

    ConfigCategory {
        name: i18n("Miscellaneous")
        icon: "applications-system"
        source: "configMisc.qml"
    }
}
