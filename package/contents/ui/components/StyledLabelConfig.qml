import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Dialogs
import QtQuick.Layouts
import org.kde.kirigami as Kirigami
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

    Kirigami.Heading {
        text: "Text"
        Kirigami.FormData.isSection: true
    }

    RowLayout {
        Kirigami.FormData.label: "Color:"

        KQControls.ColorButton {
            id: colorButton

            Layout.fillWidth: true
            showAlphaChannel: true
            onAccepted: {
                colorTextField.text = colorButton.color;
            }
        }

        TextField {
            id: colorTextField

            onTextEdited: {
                colorButton.color = colorTextField.text;
            }
        }
    }

    Button {
        Kirigami.FormData.label: "Font style:"
        text: "Choose font style..."
        Layout.fillWidth: true
        onClicked: fontDialog.open()
    }

    FontDialog {
        id: fontDialog
    }

    Kirigami.Heading {
        text: "Stroke"
        Kirigami.FormData.isSection: true
    }

    CheckBox {
        id: strokeEnabledCheckBox

        Kirigami.FormData.label: "Enabled:"
    }

    RowLayout{
        Kirigami.FormData.label: "Color:"
        enabled: strokeEnabledCheckBox.checked

        KQControls.ColorButton {
            id: strokeColorButton
            enabled: strokeEnabledCheckBox.checked

            Layout.fillWidth: true
            showAlphaChannel: true
            onAccepted: {
                strokeColorTextField.text = strokeColorButton.color;
            }
        }

        TextField {
            id: strokeColorTextField

            Layout.fillWidth: true
            onTextEdited: {
                strokeColorButton.color = strokeColorTextField.text;
            }
        }
    }

    Kirigami.Heading {
        text: "Blur"
        Kirigami.FormData.isSection: true
    }

    CheckBox {
        id: blurEnabledCheckBox

        Kirigami.FormData.label: "Enabled:"
    }

    Slider {
        id: blurSlider
        enabled: blurEnabledCheckBox.checked

        Kirigami.FormData.label: "Amount:"
        Layout.fillWidth: true
        from: 0
        to: 1
        value: 1
        stepSize: 0.05
    }

    RowLayout {
        enabled: blurEnabledCheckBox.checked
        Kirigami.FormData.label: "Max:"
        
        Slider {
            id: blurMaxSlider

            Layout.fillWidth: true
            from: 2
            to: 64
            value: 32
            stepSize: 1
        }

        Kirigami.ContextualHelpButton {
            toolTipText: i18n("This property defines the maximum pixel radius that blur with value 1.0 will reach.")
        }
    }

    RowLayout {
        Kirigami.FormData.label: "Multiplier:"
        enabled: blurEnabledCheckBox.checked

        RealSpinBox {
        id: blurMultiplierSpinBox

        from: 0.0
        value: 0
        to: 99999
        stepSize: 1
        editable: true
        }

        Kirigami.ContextualHelpButton {
            toolTipText: i18n("This property defines a multiplier for extending the blur radius.")
        }
    }

    Kirigami.Heading {
        text: "Drop shadow"
        Kirigami.FormData.isSection: true
    }

    CheckBox {
        id: dropShadowEnabledCheckBox

        Kirigami.FormData.label: "Enabled:"
    }

    Slider {
        id: dropShadowOpacitySlider
        enabled: dropShadowEnabledCheckBox.checked

        Kirigami.FormData.label: "Opacity"
        Layout.fillWidth: true
        from: 0
        to: 1
        value: 1
        stepSize: 0.05
    }

    Slider {
        id: dropShadowBlurSlider
        enabled: dropShadowEnabledCheckBox.checked

        Kirigami.FormData.label: "Blur"
        Layout.fillWidth: true
        from: 0
        to: 1
        value: 0.6
        stepSize: 0.05
    }

    Slider {
        id: dropShadowScaleSlider
        enabled: dropShadowEnabledCheckBox.checked

        Kirigami.FormData.label: "Scale:"
        Layout.fillWidth: true
        from: 0
        value: 1
        to: 2
        stepSize: 0.1
    }

    RealSpinBox {
        id: dropShadowHorizontalOffsetSpinBox
        enabled: dropShadowEnabledCheckBox.checked

        Kirigami.FormData.label: "Horizontal offset:"
        from: -99999
        value: 5
        to: 99999
        stepSize: 1
        editable: true
    }

    RealSpinBox {
        id: dropShadowVerticalOffsetSpinBox
        enabled: dropShadowEnabledCheckBox.checked

        Kirigami.FormData.label: "Vertical offset:"
        from: -99999
        value: 5
        to: 99999
        stepSize: 1
        editable: true
    }

    RowLayout {
        Kirigami.FormData.label: "Color:"
        enabled: dropShadowEnabledCheckBox.checked

        KQControls.ColorButton {
            id: dropShadowColorButton

            Layout.fillWidth: true
            showAlphaChannel: true
            onAccepted: {
                dropShadowColorTextField.text = dropShadowColorButton.color;
            }
        }

        TextField {
            id: dropShadowColorTextField

            Layout.fillWidth: true
            onTextEdited: {
                dropShadowColorButton.color = dropShadowColorTextField.text;
            }
        }
    }
}
