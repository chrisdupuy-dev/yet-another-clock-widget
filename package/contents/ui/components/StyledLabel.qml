pragma ComponentBehavior: Bound

import "../utilities"
import QtQuick
import QtQuick.Effects
import org.kde.plasma.components as PlasmaComponents

Item {
    id: root

    readonly property real centerX: {
        return x + (width / 2);
    }
    readonly property real centerY: {
        return y + (height / 2);
    }
    property alias text: label.text
    property alias color: label.color
    property alias fontFamily: label.font.family
    property alias fontPointSize: label.font.pointSize
    property alias fontStyleName: label.font.styleName
    property alias fontStrikeout: label.font.strikeout
    property alias fontUnderline: label.font.underline
    property bool strokeEnabled: false
    property alias strokeColor: label.styleColor
    property bool blurEnabled: false
    property real blur: 0.0 // 0.0 - 1.0
    property int blurMax: 32 // 2 - 64
    property real blurMultiplier: 0.0 // 0.0 - inf 
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

    implicitWidth: label.implicitWidth
    implicitHeight: label.implicitHeight
    state: {
        switch (root.anchorAlignment) {
        case Enums.Alignment.Top:
            return "anchoredTop";
        case Enums.Alignment.Right:
            return "anchoredRight";
        case Enums.Alignment.Bottom:
            return "anchoredBottom";
        case Enums.Alignment.Left:
            return "anchoredLeft";
        case Enums.Alignment.Offset:
        default:
            return "offset";
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
                    right: anchorTarget?.left
                    bottom: undefined
                    left: undefined
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

    PlasmaComponents.Label {
        id: label
   
        style: root.strokeEnabled ? Text.Outline : Text.Normal
        styleColor: root.strokeColor

        layer.enabled: true
        layer.effect: MultiEffect {
            blurEnabled: root.blurEnabled
            blur: root.blur
            blurMax: root.blurMax
            blurMultiplier: root.blurMultiplier

            shadowEnabled: root.dropShadowEnabled
            shadowColor: root.dropShadowColor
            shadowOpacity: root.dropShadowOpacity
            shadowScale: root.dropShadowScale
            shadowBlur: root.dropShadowBlur
            shadowVerticalOffset: root.dropShadowVerticalOffset
            shadowHorizontalOffset: root.dropShadowHorizontalOffset

            autoPaddingEnabled: false
            paddingRect: Qt.rect(600, 600, 600, 600) 
        }
    }

}
