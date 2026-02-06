pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

RowLayout {
  id: root

  property alias from: slider.from
  property alias value: slider.value
  property alias to: slider.to
  property alias stepSize: slider.stepSize
  
  property real defaultValue

  Slider {
      id: slider

      Layout.fillWidth: true
  }

  ToolButton {
      id: toolButton

      opacity: slider.value !== root.defaultValue ? 100 : 0

      text: i18n("Reset")
      onClicked: slider.value = root.defaultValue
  }
}