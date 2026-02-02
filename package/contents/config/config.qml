import QtQuick 2.0
import org.kde.plasma.configuration 2.0

ConfigModel {
    ConfigCategory {
        name: i18n("Global Appearance")
        icon: "preferences-desktop-color"
        source: "./configs/configGlobal.qml"
    }

    ConfigCategory {
        name: i18n("Time Appearance")
        icon: "clock"
        source: "./configs/configTime.qml"
    }

    ConfigCategory {
        name: i18n("Date Appearance")
        icon: "date"
        source: "./configs/configDate.qml"
    }

    ConfigCategory {
        name: i18n("Time Zone Appearance")
        icon: "globe"
        source: "./configs/configTimeZone.qml"
    }

    ConfigCategory {
        name: i18n("Miscellaneous")
        icon: "applications-system"
        source: "./configs/configMisc.qml"
    }

}
