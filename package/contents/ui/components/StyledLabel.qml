pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Effects

import org.kde.plasma.components as PlasmaComponents

Item {
  id: root

  implicitWidth: label.implicitWidth
  implicitHeight: label.implicitHeight

  property alias text: label.text
  property alias color: label.color

  property alias fontFamily: label.font.family
  property alias fontPointSize: label.font.pointSize
  property alias fontStyleName: label.font.styleName
  property alias fontStrikeout: label.font.strikeout
  property alias fontUnderline: label.font.underline

  Repeater {
    id: repeater
    model: [
        { x: -2, y: 0 },
        { x:  2, y: 0 },
        { x: 0, y: -2 },
        { x: 0, y: 2 },
        { x: -2, y: -2 },
        { x: 2, y: -2 },
        { x: -2, y: 2 },
        { x: 2, y: 2 }
    ]

    PlasmaComponents.Label {
        required property var modelData

        text: label.text
        font: label.font
        color: "black"

        x: modelData.x
        y: modelData.y
    }
  }

  PlasmaComponents.Label {
      id: label

      layer.enabled: true
      layer.effect: MultiEffect {
          shadowEnabled: true
          shadowColor: '#000000'
          shadowBlur: 1
          shadowVerticalOffset: 6
          shadowHorizontalOffset: 6
      }
  }
}        