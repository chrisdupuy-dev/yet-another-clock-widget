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

  property bool strokeEnabled: false
  property int strokeSize: 1
  property string strokeColor: '#000000'

  property bool dropShadowEnabled: false
  property string dropShadowColor: '#000000'

  Repeater {
    id: repeater

    model: [
        { x: -root.strokeSize, y: 0 },
        { x:  root.strokeSize, y: 0 },
        { x: 0, y: -root.strokeSize },
        { x: 0, y: root.strokeSize },
        { x: -root.strokeSize, y: -root.strokeSize },
        { x: root.strokeSize, y: -root.strokeSize },
        { x: -root.strokeSize, y: root.strokeSize },
        { x: root.strokeSize, y: root.strokeSize }
    ]

    PlasmaComponents.Label {
        required property var modelData

        text: label.text
        font: label.font
        color: root.strokeColor

        x: modelData.x
        y: modelData.y
    }
  }

  PlasmaComponents.Label {
      id: label

      layer.enabled: true
      layer.effect: MultiEffect {
          shadowEnabled: root.dropShadowEnabled
          shadowColor: root.dropShadowColor
          shadowBlur: 1
          shadowVerticalOffset: 6
          shadowHorizontalOffset: 6
      }
  }
}        