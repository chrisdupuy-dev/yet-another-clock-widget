import "../components"
import "../utilities"
import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts
import org.kde.kcmutils as KCM
import org.kde.kirigami 2.5 as Kirigami

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
    property alias cfg_timeZoneStrokeSize: styledLabelConfig.strokeSize
    property alias cfg_timeZoneStrokeColorText: styledLabelConfig.strokeColorText
    property alias cfg_timeZoneStrokeColorButton: styledLabelConfig.strokeColorButton
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

            CheckBox {
                id: showTimeZoneCheckBox

                Kirigami.FormData.label: "Show timeZone:"
            }

            ComboBox {
                id: timeZoneFormatComboBox

                Kirigami.FormData.label: "TimeZone format:"
                model: timeZoneFormatModel
                textRole: "text"
                valueRole: "value"
                onActivated: {
                    currentIndex = timeZoneAppearance.cfg_timeZoneFormat;
                }
                onAccepted: {
                    timeZoneAppearance.cfg_timeZoneFormat = currentIndex;
                }
            }

            ComboBox {
                id: timeZoneAlignmentComboBox

                Kirigami.FormData.label: "TimeZone alignment:"
                model: timeZoneAlignmentModel
                textRole: "text"
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

            SpinBox {
                id: timeZoneMarginSpinBox

                Kirigami.FormData.label: "TimeZone alignment margin:"
                from: 0
                value: 5
                stepSize: 1
                editable: true
            }

            RealSpinBox {
                id: timeZoneOffsetXSpinBox

                Kirigami.FormData.label: "TimeZone alignment X offset:"
                from: -99999
                to: 99999
                value: 0
                stepSize: 1
                editable: true
            }

            RealSpinBox {
                id: timeZoneOffsetYSpinBox

                Kirigami.FormData.label: "TimeZone alignment Y offset:"
                from: -99999
                to: 99999
                value: 25
                stepSize: 1
                editable: true
            }

            CheckBox {
                id: timeZoneIsGlobalStyled

                Kirigami.FormData.label: "Use global style:"
            }

        }

        StyledLabelConfig {
            id: styledLabelConfig

            enabled: !timeZoneIsGlobalStyled.checked
            twinFormLayouts: [timeZoneFormatLayout]
        }

    }

}
