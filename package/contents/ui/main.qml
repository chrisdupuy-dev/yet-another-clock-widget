pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import "components"
import org.kde.kirigami as Kirigami
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.plasma5support as P5Support
import org.kde.plasma.plasmoid
import org.kde.plasma.workspace.calendar as PlasmaCalendar
import "utilities"

PlasmoidItem {
    id: root
    
    readonly property string currentDate: DateTimeFormatter.formatDate(dataSource.data["Local"]["DateTime"], root.dateFormat, root.dateCustomFormat)
    property int timeFormat: Plasmoid.configuration.timeFormat
    property int showSeconds: Plasmoid.configuration.showSeconds
    property int dateFormat: Plasmoid.configuration.dateFormat
    property string dateCustomFormat: Plasmoid.configuration.dateCustomFormat
    property int dateAlignment: Plasmoid.configuration.dateAlignment
    property int dateMargin: Plasmoid.configuration.dateMargin
    property int dateOffsetX: Plasmoid.configuration.dateOffsetX / 100
    property int dateOffsetY: Plasmoid.configuration.dateOffsetY / 100
    property int timeZoneFormat: Plasmoid.configuration.timeZoneFormat
    property int timeZoneAlignment: Plasmoid.configuration.timeZoneAlignment
    property int timeZoneMargin: Plasmoid.configuration.timeZoneMargin
    property int timeZoneOffsetX: Plasmoid.configuration.timeZoneOffsetX / 100
    property int timeZoneOffsetY: Plasmoid.configuration.timeZoneOffsetY / 100
    property int timeZoneUtcOffset
    property string timeZoneName
    property string timeZoneAbbreviation
    property string timeZoneCity
    property string timeZoneContinent
    readonly property string timeZoneFull: `${timeZoneName} ${timeZoneAbbreviation} ${DateTimeFormatter.formatUtcOffset(timeZoneUtcOffset)}`
    readonly property string timeStyleKey: Plasmoid.configuration.timeIsGlobalStyled ? "global" : "time"
    readonly property string dateStyleKey: Plasmoid.configuration.dateIsGlobalStyled ? "global" : "date"
    readonly property string timeZoneStyleKey: Plasmoid.configuration.timeZoneIsGlobalStyled ? "global" : "timeZone"
    readonly property var textStyles: ({
        "global": {
            "textColor": Plasmoid.configuration.globalTextColor,
            "fontFamily": Plasmoid.configuration.globalFontFamily,
            "fontPointSize": Plasmoid.configuration.globalFontPointSize,
            "fontStyleName": Plasmoid.configuration.globalFontStyleName,
            "fontStrikeout": Plasmoid.configuration.globalFontStrikeout,
            "fontUnderline": Plasmoid.configuration.globalFontUnderline,
            "strokeEnabled": Plasmoid.configuration.globalStrokeEnabled,
            "strokeColor": Plasmoid.configuration.globalStrokeColorText,
            "blurEnabled": Plasmoid.configuration.globalBlurEnabled,
            "blur": Plasmoid.configuration.globalBlur,
            "blurMax": Plasmoid.configuration.globalBlurMax,
            "blurMultiplier": Plasmoid.configuration.globalBlurMultiplier,
            "dropShadowEnabled": Plasmoid.configuration.globalDropShadowEnabled,
            "dropShadowColor": Plasmoid.configuration.globalDropShadowColorText,
            "dropShadowOpacity": Plasmoid.configuration.globalDropShadowOpacity,
            "dropShadowBlur": Plasmoid.configuration.globalDropShadowBlur,
            "dropShadowScale": Plasmoid.configuration.globalDropShadowScale,
            "dropShadowHorizontalOffset": Plasmoid.configuration.globalDropShadowHorizontalOffset / 100,
            "dropShadowVerticalOffset": Plasmoid.configuration.globalDropShadowVerticalOffset / 100
        },
        "time": {
            "textColor": Plasmoid.configuration.timeTextColor,
            "fontFamily": Plasmoid.configuration.timeFontFamily,
            "fontPointSize": Plasmoid.configuration.timeFontPointSize,
            "fontStyleName": Plasmoid.configuration.timeFontStyleName,
            "fontStrikeout": Plasmoid.configuration.timeFontStrikeout,
            "fontUnderline": Plasmoid.configuration.timeFontUnderline,
            "strokeEnabled": Plasmoid.configuration.timeStrokeEnabled,
            "strokeColor": Plasmoid.configuration.timeStrokeColorText,        
            "blurEnabled": Plasmoid.configuration.timeBlurEnabled,
            "blur": Plasmoid.configuration.timeBlur,
            "blurMax": Plasmoid.configuration.timeBlurMax,
            "blurMultiplier": Plasmoid.configuration.timeBlurMultiplier,
            "dropShadowEnabled": Plasmoid.configuration.timeDropShadowEnabled,
            "dropShadowColor": Plasmoid.configuration.timeDropShadowColorText,
            "dropShadowOpacity": Plasmoid.configuration.timeDropShadowOpacity,
            "dropShadowBlur": Plasmoid.configuration.timeDropShadowBlur,
            "dropShadowScale": Plasmoid.configuration.timeDropShadowScale,
            "dropShadowHorizontalOffset": Plasmoid.configuration.timeDropShadowHorizontalOffset / 100,
            "dropShadowVerticalOffset": Plasmoid.configuration.timeDropShadowVerticalOffset / 100
        },
        "date": {
            "textColor": Plasmoid.configuration.dateTextColor,
            "fontFamily": Plasmoid.configuration.dateFontFamily,
            "fontPointSize": Plasmoid.configuration.dateFontPointSize,
            "fontStyleName": Plasmoid.configuration.dateFontStyleName,
            "fontStrikeout": Plasmoid.configuration.dateFontStrikeout,
            "fontUnderline": Plasmoid.configuration.dateFontUnderline,
            "strokeEnabled": Plasmoid.configuration.dateStrokeEnabled,
            "strokeColor": Plasmoid.configuration.dateStrokeColorText,
            "blurEnabled": Plasmoid.configuration.dateBlurEnabled,
            "blur": Plasmoid.configuration.dateBlur,
            "blurMax": Plasmoid.configuration.dateBlurMax,
            "blurMultiplier": Plasmoid.configuration.dateBlurMultiplier,
            "dropShadowEnabled": Plasmoid.configuration.dateDropShadowEnabled,
            "dropShadowColor": Plasmoid.configuration.dateDropShadowColorText,
            "dropShadowOpacity": Plasmoid.configuration.dateDropShadowOpacity,
            "dropShadowBlur": Plasmoid.configuration.dateDropShadowBlur,
            "dropShadowScale": Plasmoid.configuration.dateDropShadowScale,
            "dropShadowHorizontalOffset": Plasmoid.configuration.dateDropShadowHorizontalOffset / 100,
            "dropShadowVerticalOffset": Plasmoid.configuration.dateDropShadowVerticalOffset / 100
        },
        "timeZone": {
            "textColor": Plasmoid.configuration.timeZoneTextColor,
            "fontFamily": Plasmoid.configuration.timeZoneFontFamily,
            "fontPointSize": Plasmoid.configuration.timeZoneFontPointSize,
            "fontStyleName": Plasmoid.configuration.timeZoneFontStyleName,
            "fontStrikeout": Plasmoid.configuration.timeZoneFontStrikeout,
            "fontUnderline": Plasmoid.configuration.timeZoneFontUnderline,
            "strokeEnabled": Plasmoid.configuration.timeZoneStrokeEnabled,
            "strokeColor": Plasmoid.configuration.timeZoneStrokeColorText,
            "blurEnabled": Plasmoid.configuration.timeZoneBlurEnabled,
            "blur": Plasmoid.configuration.timeZoneBlur,
            "blurMax": Plasmoid.configuration.timeZoneBlurMax,
            "blurMultiplier": Plasmoid.configuration.timeZoneBlurMultiplier,
            "dropShadowEnabled": Plasmoid.configuration.timeZoneDropShadowEnabled,
            "dropShadowColor": Plasmoid.configuration.timeZoneDropShadowColorText,
            "dropShadowOpacity": Plasmoid.configuration.timeZoneDropShadowOpacity,
            "dropShadowBlur": Plasmoid.configuration.timeZoneDropShadowBlur,
            "dropShadowScale": Plasmoid.configuration.timeZoneDropShadowScale,
            "dropShadowHorizontalOffset": Plasmoid.configuration.timeZoneDropShadowHorizontalOffset / 100,
            "dropShadowVerticalOffset": Plasmoid.configuration.timeZoneDropShadowVerticalOffset / 100
        }
    })

    Plasmoid.backgroundHints: PlasmaCore.Types.NoBackground
    preferredRepresentation: compactRepresentation
    toolTipMainText: Qt.locale().toString(dataSource.data["Local"]["DateTime"], "dddd")
    toolTipSubText: `${
        DateTimeFormatter.formatTime(
            dataSource.data["Local"]["DateTime"],
            root.timeFormat,
            root.showSeconds === Enums.ShowSeconds.Always || root.showSeconds === Enums.ShowSeconds.TooltipOnly
        )
        }\n${currentDate}\n${timeZoneFull}`
    Component.onCompleted: {
        dataSource.dataChanged();
    }

    P5Support.DataSource {
        id: dataSource

        engine: "time"
        connectedSources: ["Local"]
        interval: Plasmoid.configuration.intervalRate
        onDataChanged: {
            const local = dataSource.data["Local"];
            const currentTZOffset = local["Offset"] / 60;
            const currentTZName = local["Timezone"];
            const currentTZAbbrev = local["Timezone Abbreviation"];
            const currentTZCity = local["Timezone City"];
            const currentTZContinent = local["Timezone Continent"];
            if (root.timeZoneUtcOffset !== currentTZOffset) {
                root.timeZoneUtcOffset = currentTZOffset;
                root.timeZoneName = currentTZName;
                root.timeZoneAbbreviation = currentTZAbbrev;
                root.timeZoneCity = currentTZCity;
                root.timeZoneContinent = currentTZContinent;
                Date.timeZoneUpdated();
            }
        }
        Component.onCompleted: {
            dataChanged();
        }
    }

    compactRepresentation: MouseArea {
        id: timeDateArea
            
        property bool wasExpanded
        Layout.minimumWidth: parent.implicitWidth
        Layout.minimumHeight: parent.implicitHeight
        Layout.preferredWidth: Layout.minimumWidth
        Layout.preferredHeight: Layout.minimumHeight

        activeFocusOnTab: true
        Accessible.name: Plasmoid.title
        Accessible.description: i18nc("@info:tooltip", "Current time is %1; Current date is %2", DateTimeFormatter.formatTime(dataSource.data["Local"]["DateTime"], root.timeFormat, (root.showSeconds === Enums.ShowSeconds.Always)), root.currentDate)
        Accessible.role: Accessible.Button
        onPressed: wasExpanded = root.expanded
        onClicked: root.expanded = !wasExpanded

        StyledLabel {
            id: timeLabel
            Layout.fillHeight: true
            Layout.fillWidth: true

            anchorTarget: parent
            anchorAlignment: Enums.Alignment.Offset
            offsetX: 0
            offsetY: 0

            readonly property var style: root.textStyles[root.timeStyleKey] || root.textStyles.global

            visible: Plasmoid.configuration.showTime
            text: i18n(DateTimeFormatter.formatTime(dataSource.data["Local"]["DateTime"], root.timeFormat, root.showSeconds === Enums.ShowSeconds.Always))
            color: style.textColor ?? '#FFFFFF'
            fontFamily: style.fontFamily
            fontPointSize: style.fontPointSize
            fontStyleName: style.fontStyleName
            fontStrikeout: style.fontStrikeout
            fontUnderline: style.fontUnderline
            strokeEnabled: style.strokeEnabled
            strokeColor: style.strokeColor ?? '#000000'
            blurEnabled: style.blurEnabled
            blur: style.blur
            blurMax: style.blurMax
            blurMultiplier: style.blurMultiplier
            dropShadowEnabled: style.dropShadowEnabled
            dropShadowColor: style.dropShadowColor ?? '#000000'
            dropShadowOpacity: style.dropShadowOpacity
            dropShadowBlur: style.dropShadowBlur
            dropShadowScale: style.dropShadowScale
            dropShadowHorizontalOffset: style.dropShadowHorizontalOffset
            dropShadowVerticalOffset: style.dropShadowVerticalOffset
        }

        StyledLabel {
            id: dateLabel

            readonly property var style: root.textStyles[root.dateStyleKey] || root.textStyles.global

            visible: Plasmoid.configuration.showDate
            text: root.currentDate
            color: style.textColor ?? '#FFFFFF'
            fontFamily: style.fontFamily
            fontPointSize: style.fontPointSize
            fontStyleName: style.fontStyleName
            fontStrikeout: style.fontStrikeout
            fontUnderline: style.fontUnderline
            strokeEnabled: style.strokeEnabled
            strokeColor: style.strokeColor ?? '#000000'
            blurEnabled: style.blurEnabled
            blur: style.blur
            blurMax: style.blurMax
            blurMultiplier: style.blurMultiplier
            dropShadowEnabled: style.dropShadowEnabled
            dropShadowColor: style.dropShadowColor ?? '#000000'
            dropShadowOpacity: style.dropShadowOpacity
            dropShadowBlur: style.dropShadowBlur
            dropShadowScale: style.dropShadowScale
            dropShadowHorizontalOffset: style.dropShadowHorizontalOffset
            dropShadowVerticalOffset: style.dropShadowVerticalOffset
            anchorAlignment: root.dateAlignment
            anchorTarget: timeLabel
            anchorMargin: root.dateMargin
            offsetX: root.dateOffsetX
            offsetY: root.dateOffsetY
        }

        StyledLabel {
            id: timeZoneLabel

            readonly property var style: root.textStyles[root.timeZoneStyleKey] || root.textStyles.global

            visible: Plasmoid.configuration.showTimeZone
            text: {
                switch (root.timeZoneFormat) {
                case Enums.TimeZoneFormat.City:
                    return root.timeZoneCity;
                case Enums.TimeZoneFormat.Continent:
                    return root.timeZoneContinent;
                case Enums.TimeZoneFormat.Abbreviation:
                    return root.timeZoneAbbreviation;
                case Enums.TimeZoneFormat.UtcOffset:
                    return DateTimeFormatter.formatUtcOffset(root.timeZoneUtcOffset);
                case Enums.TimeZoneFormat.Full:
                    return root.timeZoneFull;
                case Enums.TimeZoneFormat.Name:
                default:
                    return root.timeZoneName;
                }
            }
            color: style.textColor ?? '#FFFFFF'
            fontFamily: style.fontFamily
            fontPointSize: style.fontPointSize
            fontStyleName: style.fontStyleName
            fontStrikeout: style.fontStrikeout
            fontUnderline: style.fontUnderline
            strokeEnabled: style.strokeEnabled
            strokeColor: style.strokeColor ?? '#000000'
            blurEnabled: style.blurEnabled
            blur: style.blur
            blurMax: style.blurMax
            blurMultiplier: style.blurMultiplier
            dropShadowEnabled: style.dropShadowEnabled
            dropShadowColor: style.dropShadowColor ?? '#000000'
            dropShadowOpacity: style.dropShadowOpacity
            dropShadowBlur: style.dropShadowBlur
            dropShadowScale: style.dropShadowScale
            dropShadowHorizontalOffset: style.dropShadowHorizontalOffset
            dropShadowVerticalOffset: style.dropShadowVerticalOffset
            anchorAlignment: root.timeZoneAlignment
            anchorTarget: timeLabel
            anchorMargin: root.timeZoneMargin
            offsetX: root.timeZoneOffsetX
            offsetY: root.timeZoneOffsetY
        }
    }

    fullRepresentation: PlasmaCalendar.MonthView {
        readonly property var appletInterface: root

        Layout.minimumWidth: Kirigami.Units.gridUnit * 22
        Layout.maximumWidth: Kirigami.Units.gridUnit * 80
        Layout.minimumHeight: Kirigami.Units.gridUnit * 22
        Layout.maximumHeight: Kirigami.Units.gridUnit * 40
        today: dataSource.data["Local"]["DateTime"]
    }
}
