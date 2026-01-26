import QtQuick 2.0
import QtQuick.Controls 2.0
import org.kde.kirigami 2.5 as Kirigami
import org.kde.kcmutils as KCM
import org.kde.kquickcontrols as KQControls

KCM.SimpleKCM {
    property alias cfg_showDate: showDateCheckBox.checked
    
    property alias cfg_timeTextColorText: timeTextColorTextField.text
    property alias cfg_timeTextColorButton: timeTextColorButton.color

    Kirigami.FormLayout {
        CheckBox {
            id: showDateCheckBox
            text: i18n("Show date")
        }

        KQControls.ColorButton {
            id: timeTextColorButton
            showAlphaChannel: true
            onAccepted: {
                timeTextColorTextField.text = timeTextColorButton.color
            }
        }

        TextField {
            id: timeTextColorTextField
            onTextEdited: {
                timeTextColorButton.color = timeTextColorTextField.text
            }
        }
    }
}
