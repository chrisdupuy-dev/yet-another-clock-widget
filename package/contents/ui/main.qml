pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts

import org.kde.plasma.plasmoid
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.components as PlasmaComponents
import org.kde.plasma.plasma5support as P5Support
import org.kde.kirigami as Kirigami

import org.kde.plasma.workspace.calendar 2.0 as PlasmaCalendar

PlasmoidItem {
    id: root

    width: Kirigami.Units.gridUnit * 15
    height: Kirigami.Units.gridUnit * 15

    readonly property string currentTime: Qt.locale().toString(dataSource.data["Local"]["DateTime"], Qt.locale().timeFormat(Locale.ShortFormat))
    readonly property string currentDate: Qt.locale().toString(dataSource.data["Local"]["DateTime"], Qt.locale().dateFormat(Locale.ShortFormat))

    property bool showDate: Plasmoid.configuration.showDate
    property string timeTextColor: Plasmoid.configuration.timeTextColorText

    property string timeTextFontFamily: Plasmoid.configuration.timeTextFontFamily
    property double timeTextFontPointSize: Plasmoid.configuration.timeTextFontPointSize
    property string timeTextFontStyleName: Plasmoid.configuration.timeTextFontStyleName
    property bool timeTextFontStrikeout: Plasmoid.configuration.timeTextFontStrikeout
    property bool timeTextFontUnderline: Plasmoid.configuration.timeTextFontUnderline

    property int tzOffset
    property bool isHovered

    Plasmoid.backgroundHints: PlasmaCore.Types.NoBackground;
    preferredRepresentation: compactRepresentation

    toolTipMainText: Qt.locale().toString(dataSource.data["Local"]["DateTime"],"dddd")
    toolTipSubText: `${currentTime}\n${currentDate}`

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

        PlasmaComponents.Label {
            text: qsTr(root.currentTime)
            color: root.timeTextColor
            font.family: root.timeTextFontFamily
            font.pointSize: root.timeTextFontPointSize
            font.styleName: root.timeTextFontStyleName
            font.strikeout: root.timeTextFontStrikeout
            font.underline: root.timeTextFontUnderline
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
