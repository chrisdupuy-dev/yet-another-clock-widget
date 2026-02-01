pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Effects

import org.kde.plasma.components as PlasmaComponents

Item {
  id: root

  implicitWidth: label.implicitWidth
  implicitHeight: label.implicitHeight

  readonly property real centerX: { return x + (width / 2) }
  readonly property real centerY: { return y + (height / 2) }

  property alias text: label.text
  property alias color: label.color

  property alias fontFamily: label.font.family
  property alias fontPointSize: label.font.pointSize
  property alias fontStyleName: label.font.styleName
  property alias fontStrikeout: label.font.strikeout
  property alias fontUnderline: label.font.underline

  property bool strokeEnabled: false
  property int strokeSize: 1
  property color strokeColor: '#000000'

  property bool dropShadowEnabled: false
  property color dropShadowColor: '#000000'
  property real dropShadowOpacity: 0.6 // 0.0 - 1.0
  property real dropShadowScale: 1 // 0.0 to inf
  property real dropShadowBlur: 1 // 0.0 - 1.0
  property real dropShadowVerticalOffset: 6 // -inf - inf
  property real dropShadowHorizontalOffset: 6 // -inf - inf

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

        visible: root.strokeEnabled
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
          shadowOpacity: root.dropShadowOpacity
          shadowScale: root.dropShadowScale
          shadowBlur: root.dropShadowBlur
          shadowVerticalOffset: root.dropShadowVerticalOffset
          shadowHorizontalOffset: root.dropShadowHorizontalOffset
      }
  }
}        