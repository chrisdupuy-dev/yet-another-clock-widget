import QtQuick 2.0
import QtQuick.Layouts
import QtQuick.Controls 2.0
import org.kde.kirigami 2.5 as Kirigami
import org.kde.kcmutils as KCM

import "components"
import "shared"

KCM.SimpleKCM {
    id: appearance

    property alias cfg_showTime: showTimeCheckBox.checked
    property alias cfg_timeFormat: timeFormatComboBox.currentIndex
    property alias cfg_showSeconds: showSecondsComboBox.currentIndex
    property alias cfg_timeIsGlobalStyled: timeIsGlobalStyled.checked

    property alias cfg_timeTextColor: styledLabelConfig.colorText
    property alias cfg_timeTextColorButton: styledLabelConfig.colorButton
    property alias cfg_timeFontFamily: styledLabelConfig.fontFamily
    property alias cfg_timeFontPointSize: styledLabelConfig.fontPointSize
    property alias cfg_timeFontStyleName: styledLabelConfig.fontStyleName
    property alias cfg_timeFontStrikeout: styledLabelConfig.fontStrikeout
    property alias cfg_timeFontUnderline: styledLabelConfig.fontUnderline
    property alias cfg_timeStrokeEnabled: styledLabelConfig.strokeEnabled
    property alias cfg_timeStrokeSize: styledLabelConfig.strokeSize
    property alias cfg_timeStrokeColorText: styledLabelConfig.strokeColorText
    property alias cfg_timeStrokeColorButton: styledLabelConfig.strokeColorButton
    property alias cfg_timeDropShadowEnabled: styledLabelConfig.dropShadowEnabled
    property alias cfg_timeDropShadowColorText: styledLabelConfig.dropShadowColorText
    property alias cfg_timeDropShadowColorButton: styledLabelConfig.dropShadowColorButton

    ListModel {
        id: timeFormatModel

        ListElement {
            text: "System default"
            value: Enums.TimeFormat.SystemDefault
        }
        ListElement {
            text: "12-hour"
            value: Enums.TimeFormat.TwelveHour
        }
        ListElement {
            text: "24-hour"
            value: Enums.TimeFormat.TwentyFourHour
        }
    }

    ListModel {
        id: showSecondsModel

        ListElement {
            text: "Tooltip only"
            value: Enums.ShowSeconds.TooltipOnly
        }
        ListElement {
            text: "Always"
            value: Enums.ShowSeconds.Always
        }
        ListElement {
            text: "Never"
            value: Enums.ShowSeconds.Never
        }
    }

    ColumnLayout {
        Kirigami.FormLayout {
            id: timeFormatLayout
            twinFormLayouts: [styledLabelConfig]

            CheckBox {
                id: showTimeCheckBox
                Kirigami.FormData.label: "Show time:"
            }

            ComboBox {
                id: timeFormatComboBox
                Kirigami.FormData.label: "Time format:"
                model: timeFormatModel
                textRole: "text"
                valueRole: "value"

                // Load from config
                onActivated: {
                    currentIndex = appearance.cfg_timeFormat;
                }

                // Save to config
                onAccepted: {
                    appearance.cfg_timeFormat = currentIndex;
                }
            }

            ComboBox {
                id: showSecondsComboBox
                Kirigami.FormData.label: "Show seconds:"
                model: showSecondsModel
                textRole: "text"
                valueRole: "value"

                // Load from config
                onActivated: {
                    currentIndex = appearance.cfg_showSeconds;
                }

                // Save to config
                onAccepted: {
                    appearance.cfg_showSeconds = currentIndex;
                }
            }

            CheckBox {
                id: timeIsGlobalStyled
                Kirigami.FormData.label: "Use global style:"
            }
        }

        StyledLabelConfig {
            id: styledLabelConfig
            enabled: !timeIsGlobalStyled.checked
            twinFormLayouts: [timeFormatLayout]
        }
    }
}
