pragma Singleton
import QtQuick

QtObject {
    enum TimeFormat { SystemDefault = 0, TwelveHour = 1, TwentyFourHour = 2 }
    enum ShowSeconds { TooltipOnly = 0, Always = 1, Never = 2 }
    enum DateFormat { SystemDefault = 0, Short = 1, Long = 2, Iso = 3, Custom = 4 }
    enum DateAlignment { Top = 0, Right = 1, Bottom = 2, Left = 3, Offset = 4 }
}