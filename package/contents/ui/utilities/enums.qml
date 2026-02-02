pragma Singleton
import QtQuick

QtObject {
    enum TimeFormat { SystemDefault = 0, TwelveHour = 1, TwentyFourHour = 2 }
    enum ShowSeconds { TooltipOnly = 0, Always = 1, Never = 2 }
    enum DateFormat { SystemDefault = 0, Short = 1, Long = 2, Iso = 3, Custom = 4 }
    enum Alignment { Top = 0, Right = 1, Bottom = 2, Left = 3, Offset = 4 }
    enum TimeZoneFormat { Name = 0, Abbreviation = 1, City = 2, Continent = 3, UtcOffset = 4, Full = 5 }
}