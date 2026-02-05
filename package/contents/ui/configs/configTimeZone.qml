import "../components"
import "../utilities"
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import org.kde.kcmutils as KCM
import org.kde.kirigami as Kirigami

KCM.SimpleKCM {
    id: timeZoneAppearance

    property alias cfg_showTimeZone: showTimeZoneCheckBox.checked
    property alias cfg_timeZoneIsGlobalStyled: timeZoneIsGlobalStyled.checked
    property alias cfg_timeZoneFormat: timeZoneFormatComboBox.currentIndex
    property alias cfg_timeZoneAlignment: timeZoneAlignmentComboBox.currentIndex
    property alias cfg_timeZoneMargin: timeZoneMarginSpinBox.value
    property alias cfg_timeZoneOffsetX: timeZoneOffsetXSpinBox.value
    property alias cfg_timeZoneOffsetY: timeZoneOffsetYSpinBox.value
    property alias cfg_timeZoneTextColor: styledLabelConfig.colorText
    property alias cfg_timeZoneTextColorButton: styledLabelConfig.colorButton
    property alias cfg_timeZoneFontFamily: styledLabelConfig.fontFamily
    property alias cfg_timeZoneFontPointSize: styledLabelConfig.fontPointSize
    property alias cfg_timeZoneFontStyleName: styledLabelConfig.fontStyleName
    property alias cfg_timeZoneFontStrikeout: styledLabelConfig.fontStrikeout
    property alias cfg_timeZoneFontUnderline: styledLabelConfig.fontUnderline
    property alias cfg_timeZoneStrokeEnabled: styledLabelConfig.strokeEnabled
    property alias cfg_timeZoneStrokeColorText: styledLabelConfig.strokeColorText
    property alias cfg_timeZoneStrokeColorButton: styledLabelConfig.strokeColorButton
    property alias cfg_timeZoneBlurEnabled: styledLabelConfig.blurEnabled
    property alias cfg_timeZoneBlur: styledLabelConfig.blur
    property alias cfg_timeZoneBlurMax: styledLabelConfig.blurMax
    property alias cfg_timeZoneBlurMultiplier: styledLabelConfig.blurMultiplier
    property alias cfg_timeZoneDropShadowEnabled: styledLabelConfig.dropShadowEnabled
    property alias cfg_timeZoneDropShadowColorText: styledLabelConfig.dropShadowColorText
    property alias cfg_timeZoneDropShadowColorButton: styledLabelConfig.dropShadowColorButton
    property alias cfg_timeZoneDropShadowOpacity: styledLabelConfig.dropShadowOpacity
    property alias cfg_timeZoneDropShadowBlur: styledLabelConfig.dropShadowBlur
    property alias cfg_timeZoneDropShadowScale: styledLabelConfig.dropShadowScale
    property alias cfg_timeZoneDropShadowHorizontalOffset: styledLabelConfig.dropShadowHorizontalOffset
    property alias cfg_timeZoneDropShadowVerticalOffset: styledLabelConfig.dropShadowVerticalOffset

    ListModel {
        id: timeZoneAlignmentModel

        ListElement {
            text: "Top"
            value: Enums.Alignment.Top
        }

        ListElement {
            text: "Right"
            value: Enums.Alignment.Right
        }

        ListElement {
            text: "Bottom"
            value: Enums.Alignment.Bottom
        }

        ListElement {
            text: "Left"
            value: Enums.Alignment.Left
        }

        ListElement {
            text: "Offset"
            value: Enums.Alignment.Offset
        }

    }

    ListModel {
        id: timeZoneFormatModel

        ListElement {
            text: "Name"
            value: Enums.TimeZoneFormat.Name
        }

        ListElement {
            text: "Abbreviation"
            value: Enums.TimeZoneFormat.Abbreviation
        }

        ListElement {
            text: "City"
            value: Enums.TimeZoneFormat.City
        }

        ListElement {
            text: "Continent"
            value: Enums.TimeZoneFormat.Continent
        }

        ListElement {
            text: "UTC Offset"
            value: Enums.TimeZoneFormat.UtcOffset
        }

        ListElement {
            text: "Full"
            value: Enums.TimeZoneFormat.Full
        }

    }

    ColumnLayout {
        Kirigami.FormLayout {
            id: timeZoneFormatLayout

            twinFormLayouts: [styledLabelConfig]

            Kirigami.Heading {
                text: i18n("Time Zone")
                Kirigami.FormData.isSection: true
            }

            CheckBox {
                id: showTimeZoneCheckBox

                Kirigami.FormData.label: i18n("Show time zone:")
            }

            ComboBox {
                id: timeZoneFormatComboBox

                Kirigami.FormData.label: i18n("Format:")
                model: timeZoneFormatModel
                textRole: i18n("text")
                valueRole: "value"
                onActivated: {
                    currentIndex = timeZoneAppearance.cfg_timeZoneFormat;
                }
                onAccepted: {
                    timeZoneAppearance.cfg_timeZoneFormat = currentIndex;
                }
            }

            RowLayout {
                Kirigami.FormData.label: i18n("Alignment:")

                ComboBox {
                    id: timeZoneAlignmentComboBox

                    model: timeZoneAlignmentModel
                    textRole: i18n("text")
                    valueRole: "value"
                    onActivated: {
                        currentIndex = timeZoneAppearance.cfg_timeZoneAlignment;
                    }
                    onCurrentIndexChanged: {
                        timeZoneMarginSpinBox.enabled = currentIndex !== Enums.Alignment.Offset;
                        timeZoneMarginSpinBox.visible = currentIndex !== Enums.Alignment.Offset;
                        timeZoneOffsetXSpinBox.enabled = currentIndex === Enums.Alignment.Offset;
                        timeZoneOffsetXSpinBox.visible = currentIndex === Enums.Alignment.Offset;
                        timeZoneOffsetYSpinBox.enabled = currentIndex === Enums.Alignment.Offset;
                        timeZoneOffsetYSpinBox.visible = currentIndex === Enums.Alignment.Offset;
                    }
                    onAccepted: {
                        timeZoneAppearance.cfg_timeZoneAlignment = currentIndex;
                    }
                }

                Kirigami.ContextualHelpButton {
                    toolTipText: i18n("Alignment is relational to the time text.")
                }
            }

            SpinBox {
                id: timeZoneMarginSpinBox

                Kirigami.FormData.label: i18n("Alignment margin:")
                from: 0
                value: 5
                stepSize: 1
                editable: true
            }

            RealSpinBox {
                id: timeZoneOffsetXSpinBox

                Kirigami.FormData.label: i18n("TimeZone alignment X offset:")
                from: -99999
                to: 99999
                value: 0
                stepSize: 100
            }

            RealSpinBox {
                id: timeZoneOffsetYSpinBox

                Kirigami.FormData.label: i18n("TimeZone alignment Y offset:")
                from: -99999
                to: 99999
                value: 250
                stepSize: 100
                editable: true
            }

            CheckBox {
                id: timeZoneIsGlobalStyled

                Kirigami.FormData.label: i18n("Use global style:")
            }

        }

        StyledLabelConfig {
            id: styledLabelConfig

            enabled: !timeZoneIsGlobalStyled.checked
            twinFormLayouts: [timeZoneFormatLayout]
        }

    }

}
