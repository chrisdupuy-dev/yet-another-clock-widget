import "../components"
import "../utilities"
import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts
import org.kde.kcmutils as KCM
import org.kde.kirigami as Kirigami

KCM.SimpleKCM {
    id: dateAppearance

    property alias cfg_showDate: showDateCheckBox.checked
    property alias cfg_dateIsGlobalStyled: dateIsGlobalStyled.checked
    property alias cfg_dateFormat: dateFormatComboBox.currentIndex
    property alias cfg_dateAlignment: dateAlignmentComboBox.currentIndex
    property alias cfg_dateMargin: dateMarginSpinBox.value
    property alias cfg_dateOffsetX: dateOffsetXSpinBox.value
    property alias cfg_dateOffsetY: dateOffsetYSpinBox.value
    property alias cfg_dateCustomFormat: dateFormatCustomTextField.text
    property alias cfg_dateTextColor: styledLabelConfig.colorText
    property alias cfg_dateTextColorButton: styledLabelConfig.colorButton
    property alias cfg_dateFontFamily: styledLabelConfig.fontFamily
    property alias cfg_dateFontPointSize: styledLabelConfig.fontPointSize
    property alias cfg_dateFontStyleName: styledLabelConfig.fontStyleName
    property alias cfg_dateFontStrikeout: styledLabelConfig.fontStrikeout
    property alias cfg_dateFontUnderline: styledLabelConfig.fontUnderline
    property alias cfg_dateStrokeEnabled: styledLabelConfig.strokeEnabled
    property alias cfg_dateStrokeColorText: styledLabelConfig.strokeColorText
    property alias cfg_dateStrokeColorButton: styledLabelConfig.strokeColorButton
    property alias cfg_dateBlurEnabled: styledLabelConfig.blurEnabled
    property alias cfg_dateBlur: styledLabelConfig.blur
    property alias cfg_dateBlurMax: styledLabelConfig.blurMax
    property alias cfg_dateBlurMultiplier: styledLabelConfig.blurMultiplier
    property alias cfg_dateDropShadowEnabled: styledLabelConfig.dropShadowEnabled
    property alias cfg_dateDropShadowColorText: styledLabelConfig.dropShadowColorText
    property alias cfg_dateDropShadowColorButton: styledLabelConfig.dropShadowColorButton
    property alias cfg_dateDropShadowOpacity: styledLabelConfig.dropShadowOpacity
    property alias cfg_dateDropShadowBlur: styledLabelConfig.dropShadowBlur
    property alias cfg_dateDropShadowScale: styledLabelConfig.dropShadowScale
    property alias cfg_dateDropShadowHorizontalOffset: styledLabelConfig.dropShadowHorizontalOffset
    property alias cfg_dateDropShadowVerticalOffset: styledLabelConfig.dropShadowVerticalOffset
    readonly property string dateFormatDocumentationUrl: "https://doc.qt.io/qt-6/qml-qtqml-qt.html#formatDateTime-method"

    ListModel {
        id: dateAlignmentModel

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
        id: dateFormatModel

        ListElement {
            text: "System default"
            value: Enums.DateFormat.SystemDefault
        }

        ListElement {
            text: "Short"
            value: Enums.DateFormat.Short
        }

        ListElement {
            text: "Long"
            value: Enums.DateFormat.Long
        }

        ListElement {
            text: "ISO"
            value: Enums.DateFormat.Iso
        }

        ListElement {
            text: "Custom"
            value: Enums.DateFormat.Custom
        }

    }

    ColumnLayout {
        Kirigami.FormLayout {
            id: dateFormatLayout

            twinFormLayouts: [styledLabelConfig]

            Kirigami.Heading {
                text: i18n("Date")
                Kirigami.FormData.isSection: true
            }

            CheckBox {
                id: showDateCheckBox

                Kirigami.FormData.label: i18n("Show date:")
            }

            ComboBox {
                id: dateFormatComboBox

                Kirigami.FormData.label: i18n("Format:")
                model: dateFormatModel
                textRole: i18n("text")
                valueRole: "value"
                onActivated: {
                    currentIndex = dateAppearance.cfg_dateFormat;
                }
                onCurrentIndexChanged: {
                    dateFormatCustomTextField.enabled = currentIndex === Enums.DateFormat.Custom;
                }
                onAccepted: {
                    dateAppearance.cfg_dateFormat = currentIndex;
                }
            }

            TextField {
                id: dateFormatCustomTextField

                Kirigami.FormData.label: i18n("Custom format:")
            }

            Text {
                id: dateFormatDocumentation

                text: `<a href='${dateAppearance.dateFormatDocumentationUrl}'>Click to view date formatting options</a>`
                textFormat: Text.RichText
                color: "blue"
                linkColor: "blue"

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        Qt.openUrlExternally(dateAppearance.dateFormatDocumentationUrl);
                    }
                }

            }

            RowLayout {
                Kirigami.FormData.label: i18n("Alignment:")

                ComboBox {
                    id: dateAlignmentComboBox

                    model: dateAlignmentModel
                    textRole: "text"
                    valueRole: "value"
                    onActivated: {
                        currentIndex = dateAppearance.cfg_dateAlignment;
                    }
                    onCurrentIndexChanged: {
                        dateMarginSpinBox.enabled = currentIndex !== Enums.Alignment.Offset;
                        dateMarginSpinBox.visible = currentIndex !== Enums.Alignment.Offset;
                        dateOffsetXSpinBox.enabled = currentIndex === Enums.Alignment.Offset;
                        dateOffsetXSpinBox.visible = currentIndex === Enums.Alignment.Offset;
                        dateOffsetYSpinBox.enabled = currentIndex === Enums.Alignment.Offset;
                        dateOffsetYSpinBox.visible = currentIndex === Enums.Alignment.Offset;
                    }
                    onAccepted: {
                        dateAppearance.cfg_dateAlignment = currentIndex;
                    }
                }

                Kirigami.ContextualHelpButton {
                    toolTipText: i18n("Alignment is relational to the time text.")
                }
            }

            SpinBox {
                id: dateMarginSpinBox

                Kirigami.FormData.label: i18n("Alignment margin:")
                from: 0
                value: 5
                stepSize: 1
                editable: true
            }

            RealSpinBox {
                id: dateOffsetXSpinBox

                Kirigami.FormData.label: i18n("Alignment X offset:")
                from: -99999
                to: 99999
                value: 0
                stepSize: 1
                editable: true
            }

            RealSpinBox {
                id: dateOffsetYSpinBox

                Kirigami.FormData.label: i18n("Alignment Y offset:")
                from: -99999
                to: 99999
                value: 25
                stepSize: 1
                editable: true
            }

            CheckBox {
                id: dateIsGlobalStyled

                Kirigami.FormData.label: i18n("Use global style:")
            }

        }

        StyledLabelConfig {
            id: styledLabelConfig

            enabled: !dateIsGlobalStyled.checked
            twinFormLayouts: [dateFormatLayout]
        }

    }

}
