pragma ComponentBehavior: Bound

import QtQuick 2.0
import QtQuick.Layouts
import QtQuick.Controls 2.0
import QtQuick.Dialogs
import org.kde.kquickcontrols as KQControls
import org.kde.kirigami 2.5 as Kirigami

Kirigami.FormLayout {
    id: root

    property alias colorText: colorTextField.text
    property alias colorButton: colorButton.color

    property alias fontFamily: fontDialog.selectedFont.family
    property alias fontPointSize: fontDialog.selectedFont.pointSize
    property alias fontStyleName: fontDialog.selectedFont.styleName
    property alias fontStrikeout: fontDialog.selectedFont.strikeout
    property alias fontUnderline: fontDialog.selectedFont.underline

    property alias strokeEnabled: strokeEnabledCheckBox.checked
    property alias strokeSize: strokeSizeTextField.text
    property alias strokeColorText: strokeColorTextField.text
    property alias strokeColorButton: strokeColorButton.color

    property alias dropShadowEnabled: dropShadowEnabledCheckBox.checked
    property alias dropShadowColorText: dropShadowColorTextField.text
    property alias dropShadowColorButton: dropShadowColorButton.color

    TextField {
        id: colorTextField
        Kirigami.FormData.label: "Text color:"

        onTextEdited: {
            colorButton.color = colorTextField.text;
        }
    }

    KQControls.ColorButton {
        id: colorButton
        Layout.fillWidth: true
        showAlphaChannel: true
        onAccepted: {
            colorTextField.text = colorButton.color;
        }
    }

    Button {
        Kirigami.FormData.label: "Text display:"
        text: "Choose Style..."
        Layout.fillWidth: true

        onClicked: fontDialog.open()
    }

    FontDialog {
        id: fontDialog
    }

    CheckBox {
        id: strokeEnabledCheckBox
        Kirigami.FormData.label: "Stroke:"
    }

    TextField {
        id: strokeSizeTextField
        Kirigami.FormData.label: "Stroke size:"
    }

    TextField {
        id: strokeColorTextField
        Kirigami.FormData.label: "Stroke color:"
        Layout.fillWidth: true
        onTextEdited: {
            strokeColorButton.color = strokeColorTextField.text;
        }
    }

    KQControls.ColorButton {
        id: strokeColorButton
        Layout.fillWidth: true
        showAlphaChannel: true
        onAccepted: {
            strokeColorTextField.text = strokeColorButton.color;
        }
    }

    // Drop shadow
    CheckBox {
        id: dropShadowEnabledCheckBox
        Kirigami.FormData.label: "Drop shadow:"
    }

    TextField {
        id: dropShadowColorTextField
        Kirigami.FormData.label: "Drop shadow color:"
        Layout.fillWidth: true
        onTextEdited: {
            dropShadowColorButton.color = dropShadowColorTextField.text;
        }
    }

    KQControls.ColorButton {
        id: dropShadowColorButton
        Layout.fillWidth: true
        showAlphaChannel: true
        onAccepted: {
            dropShadowColorTextField.text = dropShadowColorButton.color;
        }
    }
}
