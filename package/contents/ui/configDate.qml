import QtQuick 2.0
import QtQuick.Layouts
import QtQuick.Controls 2.0
import org.kde.kirigami 2.5 as Kirigami
import org.kde.kcmutils as KCM

import "shared"
import "components"

KCM.SimpleKCM {
    id: appearance

    property alias cfg_showDate: showDateCheckBox.checked
    property alias cfg_dateIsGlobalStyled: dateIsGlobalStyled.checked
    property alias cfg_dateFormat: dateFormatComboBox.currentIndex
    property alias cfg_dateCustomFormat: dateFormatCustomTextField.text

    property alias cfg_dateTextColor: styledLabelConfig.colorText
    property alias cfg_dateTextColorButton: styledLabelConfig.colorButton
    property alias cfg_dateFontFamily: styledLabelConfig.fontFamily
    property alias cfg_dateFontPointSize: styledLabelConfig.fontPointSize
    property alias cfg_dateFontStyleName: styledLabelConfig.fontStyleName
    property alias cfg_dateFontStrikeout: styledLabelConfig.fontStrikeout
    property alias cfg_dateFontUnderline: styledLabelConfig.fontUnderline
    property alias cfg_dateStrokeEnabled: styledLabelConfig.strokeEnabled
    property alias cfg_dateStrokeSize: styledLabelConfig.strokeSize
    property alias cfg_dateStrokeColorText: styledLabelConfig.strokeColorText
    property alias cfg_dateStrokeColorButton: styledLabelConfig.strokeColorButton
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

            CheckBox {
                id: showDateCheckBox
                Kirigami.FormData.label: "Show date:"
            }

            ComboBox {
                id: dateFormatComboBox
                Kirigami.FormData.label: "Date format:"
                model: dateFormatModel
                textRole: "text"
                valueRole: "value"

                // Load from config
                onActivated: {
                    currentIndex = appearance.cfg_dateFormat;
                }

                onCurrentIndexChanged: {
                    dateFormatCustomTextField.enabled = currentIndex === Enums.DateFormat.Custom
                }

                // Save to config
                onAccepted: {
                    appearance.cfg_dateFormat = currentIndex;
                }
            }

            TextField {
                id: dateFormatCustomTextField
                Kirigami.FormData.label: "Custom format:"
            }

            Text {
                id: dateFormatDocumentation
                text: `<a href='${appearance.dateFormatDocumentationUrl}'>Click to view date formatting options</a>`
                textFormat: Text.RichText
                color: "blue"
                linkColor: "blue"

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        Qt.openUrlExternally(appearance.dateFormatDocumentationUrl);
                    }
                }
            }

            CheckBox {
                id: dateIsGlobalStyled
                Kirigami.FormData.label: "Use global style:"
            }
        }

        StyledLabelConfig {
            id: styledLabelConfig
            enabled: !dateIsGlobalStyled.checked
            twinFormLayouts: [dateFormatLayout]
        }
    }
}
