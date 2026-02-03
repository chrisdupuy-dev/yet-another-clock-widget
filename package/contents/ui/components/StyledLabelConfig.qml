import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Dialogs
import QtQuick.Layouts
import org.kde.kirigami 2.5 as Kirigami
import org.kde.kquickcontrols as KQControls

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
    property alias blurEnabled: blurEnabledCheckBox.checked
    property alias blur: blurSlider.value
    property alias blurMax: blurMaxSlider.value
    property alias blurMultiplier: blurMultiplierSpinBox.value
    property alias dropShadowEnabled: dropShadowEnabledCheckBox.checked
    property alias dropShadowColorText: dropShadowColorTextField.text
    property alias dropShadowColorButton: dropShadowColorButton.color
    property alias dropShadowOpacity: dropShadowOpacitySlider.value
    property alias dropShadowBlur: dropShadowBlurSlider.value
    property alias dropShadowScale: dropShadowScaleSlider.value
    property alias dropShadowHorizontalOffset: dropShadowHorizontalOffsetSpinBox.value
    property alias dropShadowVerticalOffset: dropShadowVerticalOffsetSpinBox.value

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

    // Blur
    CheckBox {
        id: blurEnabledCheckBox

        Kirigami.FormData.label: "Blur:"
    }

    Slider {
        id: blurSlider

        Kirigami.FormData.label: "Blur amount:"
        Layout.fillWidth: true
        from: 0
        to: 1
        value: 1
        stepSize: 0.05
    }

    Slider {
        id: blurMaxSlider

        Kirigami.FormData.label: "Blur max:"
        Layout.fillWidth: true
        from: 2
        to: 64
        value: 32
        stepSize: 1
    }

    RealSpinBox {
        id: blurMultiplierSpinBox

        Kirigami.FormData.label: "Blur multiplier:"
        from: 0.0
        value: 0
        to: 99999
        stepSize: 1
        editable: true
    }

    // Drop shadow
    CheckBox {
        id: dropShadowEnabledCheckBox

        Kirigami.FormData.label: "Drop shadow:"
    }

    Slider {
        id: dropShadowOpacitySlider

        Kirigami.FormData.label: "Drop shadow opacity"
        Layout.fillWidth: true
        from: 0
        to: 1
        value: 1
        stepSize: 0.05
    }

    Slider {
        id: dropShadowBlurSlider

        Kirigami.FormData.label: "Drop shadow blur"
        Layout.fillWidth: true
        from: 0
        to: 1
        value: 0.6
        stepSize: 0.05
    }

    Slider {
        id: dropShadowScaleSlider

        Kirigami.FormData.label: "Drop shadow scale:"
        Layout.fillWidth: true
        from: 0
        value: 1
        to: 2
        stepSize: 0.1
    }

    RealSpinBox {
        id: dropShadowHorizontalOffsetSpinBox

        Kirigami.FormData.label: "Drop shadow horizontal offset:"
        from: -99999
        value: 5
        to: 99999
        stepSize: 1
        editable: true
    }

    RealSpinBox {
        id: dropShadowVerticalOffsetSpinBox

        Kirigami.FormData.label: "Drop shadow vertical offset:"
        from: -99999
        value: 5
        to: 99999
        stepSize: 1
        editable: true
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
