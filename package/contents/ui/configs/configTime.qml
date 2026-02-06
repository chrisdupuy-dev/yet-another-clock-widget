import "../components"
import "../utilities"
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import org.kde.kcmutils as KCM
import org.kde.kirigami as Kirigami

KCM.SimpleKCM {
    id: timeAppearance

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
    property alias cfg_timeStrokeColorText: styledLabelConfig.strokeColorText
    property alias cfg_timeStrokeColorButton: styledLabelConfig.strokeColorButton
    property alias cfg_timeBlurEnabled: styledLabelConfig.blurEnabled
    property alias cfg_timeBlur: styledLabelConfig.blur
    property alias cfg_timeBlurDefault: styledLabelConfig.blurDefault
    property alias cfg_timeBlurMax: styledLabelConfig.blurMax
    property alias cfg_timeBlurMaxDefault: styledLabelConfig.blurMaxDefault
    property alias cfg_timeBlurMultiplier: styledLabelConfig.blurMultiplier
    property alias cfg_timeDropShadowEnabled: styledLabelConfig.dropShadowEnabled
    property alias cfg_timeDropShadowColorText: styledLabelConfig.dropShadowColorText
    property alias cfg_timeDropShadowColorButton: styledLabelConfig.dropShadowColorButton
    property alias cfg_timeDropShadowOpacity: styledLabelConfig.dropShadowOpacity
    property alias cfg_timeDropShadowOpacityDefault: styledLabelConfig.dropShadowOpacityDefault
    property alias cfg_timeDropShadowBlur: styledLabelConfig.dropShadowBlur
    property alias cfg_timeDropShadowBlurDefault: styledLabelConfig.dropShadowBlurDefault
    property alias cfg_timeDropShadowScale: styledLabelConfig.dropShadowScale
    property alias cfg_timeDropShadowScaleDefault: styledLabelConfig.dropShadowScaleDefault
    property alias cfg_timeDropShadowHorizontalOffset: styledLabelConfig.dropShadowHorizontalOffset
    property alias cfg_timeDropShadowVerticalOffset: styledLabelConfig.dropShadowVerticalOffset

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

            Kirigami.Heading {
                text: i18n("Time")
                Kirigami.FormData.isSection: true
            }

            CheckBox {
                id: showTimeCheckBox

                Kirigami.FormData.label: i18n("Show time:")
            }

            ComboBox {
                id: timeFormatComboBox

                Kirigami.FormData.label: i18n("Format:")
                model: timeFormatModel
                textRole: i18n("text")
                valueRole: "value"
                onActivated: {
                    currentIndex = timeAppearance.cfg_timeFormat;
                }
                onAccepted: {
                    timeAppearance.cfg_timeFormat = currentIndex;
                }
            }

            ComboBox {
                id: showSecondsComboBox

                Kirigami.FormData.label: i18n("Show seconds:")
                model: showSecondsModel
                textRole: i18n("text")
                valueRole: "value"
                onActivated: {
                    currentIndex = timeAppearance.cfg_showSeconds;
                }
                onAccepted: {
                    timeAppearance.cfg_showSeconds = currentIndex;
                }
            }

            CheckBox {
                id: timeIsGlobalStyled

                Kirigami.FormData.label: i18n("Use global style:")
            }

        }

        StyledLabelConfig {
            id: styledLabelConfig

            enabled: !timeIsGlobalStyled.checked
            twinFormLayouts: [timeFormatLayout]
        }

    }

}
