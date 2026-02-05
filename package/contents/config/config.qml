import QtQuick
import org.kde.plasma.configuration

ConfigModel {
    ConfigCategory {
        name: i18nc("@title:group for configuration dialog page", "Global")
        icon: "preferences-desktop-color"
        source: "./configs/configGlobal.qml"
    }

    ConfigCategory {
        name: i18nc("@title:group for configuration dialog page", "Time")
        icon: "clock"
        source: "./configs/configTime.qml"
    }

    ConfigCategory {
        name: i18nc("@title:group for configuration dialog page", "Date")
        icon: "date"
        source: "./configs/configDate.qml"
    }

    ConfigCategory {
        name: i18nc("@title:group for configuration dialog page", "Time Zone")
        icon: "globe"
        source: "./configs/configTimeZone.qml"
    }

    ConfigCategory {
        name: i18nc("@title:group for configuration dialog page", "Miscellaneous")
        icon: "applications-system"
        source: "./configs/configMisc.qml"
    }

}
