import QtQuick 2.0
import QtQuick.Layouts
import QtQuick.Controls 2.0
import QtQuick.Dialogs
import org.kde.kirigami 2.5 as Kirigami
import org.kde.kcmutils as KCM
import org.kde.kquickcontrols as KQControls

KCM.SimpleKCM {
    property alias cfg_showDate: showDateCheckBox.checked
    
    property alias cfg_timeTextColorText: timeTextColorTextField.text
    property alias cfg_timeTextColorButton: timeTextColorButton.color

    property alias cfg_timeTextFontFamily: timeTextFontDialog.selectedFont.family
    property alias cfg_timeTextFontPointSize: timeTextFontDialog.selectedFont.pointSize
    property alias cfg_timeTextFontStyleName: timeTextFontDialog.selectedFont.styleName
    property alias cfg_timeTextFontStrikeout: timeTextFontDialog.selectedFont.strikeout
    property alias cfg_timeTextFontUnderline: timeTextFontDialog.selectedFont.underline
    
    Kirigami.FormLayout {
        Kirigami.FormData.label: "Font settings"
        anchors.fill: parent

        GridLayout { 
            Layout.fillWidth: true
            columns: 3

            Label {
                text: "Text color:"
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            }

            TextField {
                id: timeTextColorTextField
                Layout.fillWidth: true
                onTextEdited: {
                    timeTextColorButton.color = timeTextColorTextField.text
                }
            }

            Item {}

            Item {}

            KQControls.ColorButton {
                id: timeTextColorButton
                Layout.fillWidth: true
                showAlphaChannel: true
                onAccepted: {
                    timeTextColorTextField.text = timeTextColorButton.color
                }
            }

            Item {}

            Label {
                text: "Text display:"
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            }

            Button {
                text: "Choose Style..."
                Layout.fillWidth: true

                onClicked: timeTextFontDialog.open()
            }

            FontDialog {
                id: timeTextFontDialog
            }
        }

        GridLayout {
            Layout.fillWidth: true

            columns: 2

        }

        CheckBox {
            id: showDateCheckBox
            text: i18n("Show date")
        }
    }
}
