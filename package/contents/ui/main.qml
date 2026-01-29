pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts

import org.kde.plasma.plasmoid
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.components as PlasmaComponents
import org.kde.plasma.plasma5support as P5Support
import org.kde.kirigami as Kirigami
import org.kde.plasma.workspace.calendar 2.0 as PlasmaCalendar

import "components"
import "shared"

PlasmoidItem {
    id: root

    width: Kirigami.Units.gridUnit * 15
    height: Kirigami.Units.gridUnit * 15

    Plasmoid.backgroundHints: PlasmaCore.Types.NoBackground
    preferredRepresentation: compactRepresentation

    toolTipMainText: Qt.locale().toString(dataSource.data["Local"]["DateTime"], "dddd")
    toolTipSubText: `${currentTime}\n${currentDate}`
    readonly property var d: ({
            textColor: '#FFFFFF',
            fontFamily: '',
            fontPointSize: '12',
            fontStyleName: 'Regular',
            fontStrikeout: false,
            fontUnderline: false,
            strokeEnabled: false,
            strokeColor: '#000000',
            strokeSize: 1,
            dropShadowEnabled: false,
            dropShadowColor: '#000000'
        })
    readonly property string currentTime: {
        switch (timeFormat) {
        case Enums.TimeFormat.TwelveHour:
            return Qt.formatDateTime(dataSource.data["Local"]["DateTime"], "h:mm AP");
        case Enums.TimeFormat.TwentyFourHour:
            return Qt.formatDateTime(dataSource.data["Local"]["DateTime"], "HH:mm");
        case Enums.TimeFormat.SystemDefault:
        default:
            return Qt.locale().toString(dataSource.data["Local"]["DateTime"], Qt.locale().timeFormat(Locale.ShortFormat));
        }
    }

    readonly property string currentDate: Qt.locale().toString(dataSource.data["Local"]["DateTime"], Qt.locale().dateFormat(Locale.ShortFormat))

    property bool showDate: Plasmoid.configuration.showDate
    property int tzOffset
    property bool isHovered

    property int timeFormat: Plasmoid.configuration.timeFormat

    property bool timeIsGlobalStyled: Plasmoid.configuration.timeIsGlobalStyled
    readonly property string timeStyleKey: root.timeIsGlobalStyled ? "global" : "time"

    readonly property var textStyles: ({
            global: {
                textColor: Plasmoid.configuration.globalTextColor,
                fontFamily: Plasmoid.configuration.globalFontFamily,
                fontPointSize: Plasmoid.configuration.globalFontPointSize,
                fontStyleName: Plasmoid.configuration.globalFontStyleName,
                fontStrikeout: Plasmoid.configuration.globalFontStrikeout,
                fontUnderline: Plasmoid.configuration.globalFontUnderline,
                strokeEnabled: Plasmoid.configuration.globalStrokeEnabled,
                strokeColor: Plasmoid.configuration.globalStrokeColorText,
                strokeSize: Plasmoid.configuration.globalStrokeSize,
                dropShadowEnabled: Plasmoid.configuration.globalDropShadowEnabled,
                dropShadowColor: Plasmoid.configuration.globalDropShadowColorText
            },
            time: {
                textColor: Plasmoid.configuration.timeTextColor,
                fontFamily: Plasmoid.configuration.timeFontFamily,
                fontPointSize: Plasmoid.configuration.timeFontPointSize,
                fontStyleName: Plasmoid.configuration.timeFontStyleName,
                fontStrikeout: Plasmoid.configuration.timeFontStrikeout,
                fontUnderline: Plasmoid.configuration.timeFontUnderline,
                strokeEnabled: Plasmoid.configuration.timeStrokeEnabled,
                strokeColor: Plasmoid.configuration.timeStrokeColorText,
                strokeSize: Plasmoid.configuration.timeStrokeSize,
                dropShadowEnabled: Plasmoid.configuration.timeDropShadowEnabled,
                dropShadowColor: Plasmoid.configuration.timeDropShadowColorText
            }
        })

    function dateTimeChanged() {
        var currentTZOffset = dataSource.data["Local"]["Offset"] / 60;
        if (currentTZOffset !== tzOffset) {
            tzOffset = currentTZOffset;
            Date.timeZoneUpdated(); // inform the QML JS engine about TZ change
        }
    }

    P5Support.DataSource {
        id: dataSource
        engine: "time"
        connectedSources: ["Local"]
        interval: root.isHovered ? 1000 : 30000
        function onDataChanged() {
        }
        Component.onCompleted: {
            dataChanged();
        }
    }

    compactRepresentation: MouseArea {
        id: timeDateArea

        Layout.minimumWidth: Plasmoid.formFactor !== PlasmaCore.Types.Vertical ? timeDateArea.height : Kirigami.Units.gridUnit
        Layout.minimumHeight: Plasmoid.formFactor === PlasmaCore.Types.Vertical ? timeDateArea.width : Kirigami.Units.gridUnit

        property bool wasExpanded

        activeFocusOnTab: true
        hoverEnabled: true

        Accessible.name: Plasmoid.title
        Accessible.description: Qt.locale("@info:tooltip", "Current time is %1; Current date is %2", root.currentTime, root.currentDate)
        Accessible.role: Accessible.Button

        onPressed: wasExpanded = root.expanded
        onClicked: root.expanded = !wasExpanded
        onEntered: root.isHovered = true
        onExited: root.isHovered = false

        StyledLabel {
            id: timeLabel

            readonly property var style: root.textStyles[root.timeStyleKey] || root.textStyles.global

            text: root.currentTime
            color: style.textColor
            fontFamily: style.fontFamily
            fontPointSize: style.fontPointSize
            fontStyleName: style.fontStyleName
            fontStrikeout: style.fontStrikeout
            fontUnderline: style.fontUnderline
            strokeEnabled: style.strokeEnabled
            strokeColor: style.strokeColorText
            strokeSize: style.strokeSize
            dropShadowEnabled: style.dropShadowEnabled
            dropShadowColor: style.dropShadowColorText
        }

        PlasmaComponents.Label {
            text: qsTr(root.currentDate)
            visible: root.showDate

            anchors {
                horizontalCenter: parent.horizontalCenter
                bottom: parent.bottom
                bottomMargin: 10
            }
        }
    }

    fullRepresentation: PlasmaCalendar.MonthView {
        Layout.minimumWidth: Kirigami.Units.gridUnit * 22
        Layout.maximumWidth: Kirigami.Units.gridUnit * 80
        Layout.minimumHeight: Kirigami.Units.gridUnit * 22
        Layout.maximumHeight: Kirigami.Units.gridUnit * 40

        readonly property var appletInterface: root

        today: dataSource.data["Local"]["DateTime"]
    }

    Component.onCompleted: {
        tzOffset = new Date().getTimezoneOffset();
        dataSource.onDataChanged.connect(dateTimeChanged);
    }
}
