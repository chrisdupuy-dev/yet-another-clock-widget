pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Effects

import org.kde.plasma.components as PlasmaComponents

import "../utilities"

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

  property Item anchorTarget
  property int anchorAlignment: 3
  property int anchorMargin: 5
  property int offsetX: 0
  property int offsetY: 0

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

  states: [
    State {
        name: "anchoredTop"
        AnchorChanges {
            target: root
            anchors {
                horizontalCenter: anchorTarget?.horizontalCenter
                verticalCenter: undefined
                top: undefined
                bottom: anchorTarget?.top
                left: undefined
                right: undefined
            }
        }
        PropertyChanges {
            root.anchors.topMargin: 0
            root.anchors.rightMargin: 0
            root.anchors.bottomMargin: root.anchorMargin
            root.anchors.leftMargin: 0

            root.anchors.horizontalCenterOffset: 0
            root.anchors.verticalCenterOffset: 0
        }
    },
    State {
        name: "anchoredRight"
        AnchorChanges {
            target: root
            anchors {
                horizontalCenter: undefined
                verticalCenter: anchorTarget?.verticalCenter
                top: undefined
                bottom: undefined
                left: anchorTarget?.right
                right: undefined
            }
        }
        PropertyChanges {
            root.anchors.topMargin: 0
            root.anchors.rightMargin: 0
            root.anchors.bottomMargin: 0
            root.anchors.leftMargin: root.anchorMargin

            root.anchors.horizontalCenterOffset: 0
            root.anchors.verticalCenterOffset: 0
        }
    },
    State {
        name: "anchoredBottom"
        AnchorChanges {
            target: root
            anchors {
                horizontalCenter: anchorTarget?.horizontalCenter
                verticalCenter: undefined
                top: timeLabel.bottom
                bottom: undefined
                left: undefined
                right: undefined
            }
        }
        PropertyChanges {
            root.anchors.topMargin: root.anchorMargin
            root.anchors.rightMargin: 0
            root.anchors.bottomMargin: 0
            root.anchors.leftMargin: 0

            root.anchors.horizontalCenterOffset: 0
            root.anchors.verticalCenterOffset: 0
        }
    },
    State {
        name: "anchoredLeft"
        AnchorChanges {
            target: root
            anchors {
                horizontalCenter: undefined
                verticalCenter: anchorTarget?.verticalCenter
                top: undefined
                bottom: undefined
                left: undefined
                right: anchorTarget?.left
            }
        }
        PropertyChanges {
            root.anchors.topMargin: 0
            root.anchors.rightMargin: root.anchorMargin
            root.anchors.bottomMargin: 0
            root.anchors.leftMargin: 0

            root.anchors.horizontalCenterOffset: 0
            root.anchors.verticalCenterOffset: 0
        }
    },
    State {
        name: "offset"
        AnchorChanges {
            target: root
            anchors {
                horizontalCenter: anchorTarget?.horizontalCenter
                verticalCenter: anchorTarget?.verticalCenter
                top: undefined
                bottom: undefined
                left: undefined
                right: undefined
            }
        }
        PropertyChanges {
            root.anchors.horizontalCenterOffset: root.offsetX
            root.anchors.verticalCenterOffset: root.offsetY
        }
    }
]

state: { 
    switch(root.anchorAlignment) {
        case Enums.Alignment.Top:
            return "anchoredTop"
        case Enums.Alignment.Right:
            return "anchoredRight"
        case Enums.Alignment.Bottom:
            return "anchoredBottom"
        case Enums.Alignment.Left:
            return "anchoredLeft"
        case Enums.Alignment.Offset:
        default:
            return "offset"
    }
  }
}        