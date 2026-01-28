pragma ComponentBehavior: Bound

import QtQuick 2.0
import QtQuick.Layouts
import QtQuick.Controls 2.0
import QtQuick.Dialogs
import org.kde.kquickcontrols as KQControls

GridLayout {
  id: root
  columns: 3
  Layout.fillWidth: true
  
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

  // Text color
  Label {
      text: "Text color:"
      Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
  }

  TextField {
      id: colorTextField
      Layout.fillWidth: true
      onTextEdited: {
          colorButton.color = colorTextField.text
      }
  }

  Item {}

  Item {}

  KQControls.ColorButton {
      id: colorButton
      Layout.fillWidth: true
      showAlphaChannel: true
      onAccepted: {
          colorTextField.text = colorButton.color
      }
  }

  Item {}

  // Font style
  Label {
      text: "Text display:"
      Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
  }

  Button {
      text: "Choose Style..."
      Layout.fillWidth: true

      onClicked: fontDialog.open()
  }

  FontDialog {
      id: fontDialog
  }

  Item {}

  // Stroke
  Label {
      text: "Stroke:"
      Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
  }

  CheckBox {
    id: strokeEnabledCheckBox
  }
  
  Item{}

  Label {
      text: "Stroke size:"
      Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
  }

  TextField {
    id: strokeSizeTextField
  }

  Item{}

  Label {
      text: "Stroke color:"
      Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
  }

  TextField {
      id: strokeColorTextField
      Layout.fillWidth: true
      onTextEdited: {
          strokeColorButton.color = strokeColorTextField.text
      }
  }

  Item {}

  Item {}

  KQControls.ColorButton {
      id: strokeColorButton
      Layout.fillWidth: true
      showAlphaChannel: true
      onAccepted: {
          strokeColorTextField.text = strokeColorButton.color
      }
  }

  Item {}

  // Dropshadow
  Label {
      text: "Drop shadow:"
      Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
  }

  CheckBox {
    id: dropShadowEnabledCheckBox
  }

  Item {}

  Label {
      text: "Drop shadow color:"
      Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
  }

  TextField {
      id: dropShadowColorTextField
      Layout.fillWidth: true
      onTextEdited: {
          dropShadowColorButton.color = dropShadowColorTextField.text
      }
  }

  Item {}

  Item {}

  KQControls.ColorButton {
      id:dropShadowColorButton
      Layout.fillWidth: true
      showAlphaChannel: true
      onAccepted: {
          dropShadowColorTextField.text = dropShadowColorButton.color
      }
  }

  Item {}
}