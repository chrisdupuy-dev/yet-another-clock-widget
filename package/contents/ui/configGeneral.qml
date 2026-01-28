import QtQuick 2.0
import QtQuick.Layouts
import QtQuick.Controls 2.0
import org.kde.kirigami 2.5 as Kirigami
import org.kde.kcmutils as KCM

import "components"
import "shared"

KCM.SimpleKCM {
    id: appearance

    property alias cfg_globalTextColor: globalStyledLabelConfig.colorText
    property alias cfg_globalTextColorButton: globalStyledLabelConfig.colorButton
    property alias cfg_globalFontFamily: globalStyledLabelConfig.fontFamily
    property alias cfg_globalFontPointSize: globalStyledLabelConfig.fontPointSize
    property alias cfg_globalFontStyleName: globalStyledLabelConfig.fontStyleName
    property alias cfg_globalFontStrikeout: globalStyledLabelConfig.fontStrikeout
    property alias cfg_globalFontUnderline: globalStyledLabelConfig.fontUnderline
    property alias cfg_globalStrokeEnabled: globalStyledLabelConfig.strokeEnabled
    property alias cfg_globalStrokeSize: globalStyledLabelConfig.strokeSize
    property alias cfg_globalStrokeColorText: globalStyledLabelConfig.strokeColorText
    property alias cfg_globalStrokeColorButton: globalStyledLabelConfig.strokeColorButton
    property alias cfg_globalDropShadowEnabled: globalStyledLabelConfig.dropShadowEnabled
    property alias cfg_globalDropShadowColorText: globalStyledLabelConfig.dropShadowColorText
    property alias cfg_globalDropShadowColorButton: globalStyledLabelConfig.dropShadowColorButton

    property alias cfg_timeFormat: timeFormatComboBox.currentIndex
    property alias cfg_showDate: showDateCheckBox.checked
    
    ListModel {
        id: timeFormatModel

        ListElement { text: "System default"; value: Enums.TimeFormat.SystemDefault }
        ListElement { text: "12-hour"; value: Enums.TimeFormat.TwelveHour }
        ListElement { text: "24-hour"; value: Enums.TimeFormat.TwentyFourHour }
    }

    Kirigami.FormLayout {
        Kirigami.FormData.label: "Font settings"
        anchors.fill: parent

        StyledLabelConfig {
            id: globalStyledLabelConfig
        }

        GridLayout {
            columns: 3

            Label {
                text: "Time format:"
            }

            ComboBox {
                id: timeFormatComboBox
                model: timeFormatModel
                textRole: "text"
                valueRole: "value"

                // Load from config
                onActivated: {
                    currentIndex = appearance.cfg_timeFormat
                }

                // Save to config
                onAccepted: {
                    appearance.cfg_timeFormat = currentIndex;
                }
            }
        }

        CheckBox {
            id: showDateCheckBox
            text: i18n("Show date")
        }
    }
}
