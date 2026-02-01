pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts

import org.kde.plasma.plasmoid
import org.kde.plasma.core as PlasmaCore
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
    toolTipSubText: `${
        DateTimeFormatter.formatTime( 
            dataSource.data["Local"]["DateTime"], 
            root.timeFormat, 
            root.showSeconds === Enums.ShowSeconds.Always || root.showSeconds === Enums.ShowSeconds.TooltipOnly
        )
        }\n${currentDate}`

    readonly property string currentDate: DateTimeFormatter.formatDate(dataSource.data["Local"]["DateTime"], root.dateFormat, root.dateCustomFormat)

    property int tzOffset
    property bool isHovered

    property int timeFormat: Plasmoid.configuration.timeFormat
    property int showSeconds: Plasmoid.configuration.showSeconds

    property int dateFormat: Plasmoid.configuration.dateFormat
    property string dateCustomFormat: Plasmoid.configuration.dateCustomFormat

    readonly property string timeStyleKey: Plasmoid.configuration.timeIsGlobalStyled ? "global" : "time"
    readonly property string dateStyleKey: Plasmoid.configuration.dateIsGlobalStyled ? "global" : "date"

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
            },
            date: {
                textColor: Plasmoid.configuration.dateTextColor,
                fontFamily: Plasmoid.configuration.dateFontFamily,
                fontPointSize: Plasmoid.configuration.dateFontPointSize,
                fontStyleName: Plasmoid.configuration.dateFontStyleName,
                fontStrikeout: Plasmoid.configuration.dateFontStrikeout,
                fontUnderline: Plasmoid.configuration.dateFontUnderline,
                strokeEnabled: Plasmoid.configuration.dateStrokeEnabled,
                strokeColor: Plasmoid.configuration.dateStrokeColorText,
                strokeSize: Plasmoid.configuration.dateStrokeSize,
                dropShadowEnabled: Plasmoid.configuration.dateDropShadowEnabled,
                dropShadowColor: Plasmoid.configuration.dateDropShadowColorText
            }
        })

    P5Support.DataSource {
        id: dataSource
        engine: "time"
        connectedSources: ["Local"]
        interval: root.isHovered ? 1000 : 30000 // make configurable?
        function onDataChanged() {
            var currentTZOffset = dataSource.data["Local"]["Offset"] / 60;
            if (currentTZOffset !== root.tzOffset) {
                root.tzOffset = currentTZOffset;
                Date.timeZoneUpdated(); // inform the QML JS engine about TZ change
            }
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
        Accessible.description: i18nc("@info:tooltip", 
            "Current time is %1; Current date is %2", 
            DateTimeFormatter.formatTime(dataSource.data["Local"]["DateTime"], 
                root.timeFormat, (root.showSeconds === Enums.ShowSeconds.Always)
            ), 
            root.currentDate
        )
        Accessible.role: Accessible.Button

        onPressed: wasExpanded = root.expanded
        onClicked: root.expanded = !wasExpanded
        onEntered: root.isHovered = true
        onExited: root.isHovered = false

        StyledLabel {
            id: timeLabel
            visible: Plasmoid.configuration.showTime

            readonly property var style: root.textStyles[root.timeStyleKey] || root.textStyles.global

            text: DateTimeFormatter.formatTime(dataSource.data["Local"]["DateTime"], root.timeFormat, root.showSeconds === Enums.ShowSeconds.Always)
            color: style.textColor ?? '#FFFFFF'
            fontFamily: style.fontFamily
            fontPointSize: style.fontPointSize
            fontStyleName: style.fontStyleName
            fontStrikeout: style.fontStrikeout
            fontUnderline: style.fontUnderline
            strokeEnabled: style.strokeEnabled
            strokeColor: style.strokeColorText ?? '#000000'
            strokeSize: style.strokeSize
            dropShadowEnabled: style.dropShadowEnabled
            dropShadowColor: style.dropShadowColorText ?? '#000000'
        }

        StyledLabel {
            id: dateLabel
            visible: Plasmoid.configuration.showDate

            readonly property var style: root.textStyles[root.dateStyleKey] || root.textStyles.global

            text: root.currentDate
            color: style.textColor ?? '#FFFFFF'
            fontFamily: style.fontFamily
            fontPointSize: style.fontPointSize
            fontStyleName: style.fontStyleName
            fontStrikeout: style.fontStrikeout
            fontUnderline: style.fontUnderline
            strokeEnabled: style.strokeEnabled
            strokeColor: style.strokeColorText ?? '#000000'
            strokeSize: style.strokeSize
            dropShadowEnabled: style.dropShadowEnabled
            dropShadowColor: style.dropShadowColorText  ?? '#000000'

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
        dataSource.dataChanged();
    }
}
