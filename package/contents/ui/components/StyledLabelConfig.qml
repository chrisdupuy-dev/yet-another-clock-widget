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
}