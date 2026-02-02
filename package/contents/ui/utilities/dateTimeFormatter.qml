import QtQuick
pragma Singleton

QtObject {
    function formatTime(date: date, timeFormat: int, formatSeconds: bool) : string {
        const locale = Qt.locale();
        let format = locale.timeFormat(Locale.ShortFormat);
        if (timeFormat === Enums.TimeFormat.SystemDefault) {
            if (formatSeconds) {
                const colonIndex = format.indexOf(":");
                const insertAt = colonIndex + 3;
                format = format.slice(0, insertAt) + ":ss" + format.slice(insertAt);
            }
            return Qt.formatTime(date, format);
        }
        const seconds = formatSeconds ? ":ss" : "";
        if (timeFormat === Enums.TimeFormat.TwelveHour)
            format = `h:mm${seconds} AP`;
        else if (timeFormat === Enums.TimeFormat.TwentyFourHour)
            format = `HH:mm${seconds}`;
        return Qt.formatTime(date, format);
    }

    function formatDate(date: date, dateFormat: int, customFormat: string) : string {
        switch (dateFormat) {
        case Enums.DateFormat.Short:
            return Qt.formatDate(date, Locale.ShortFormat);
        case Enums.DateFormat.Long:
            return Qt.formatDate(date, Locale.LongFormat);
        case Enums.DateFormat.Iso:
            return date.toISOString();
        case Enums.DateFormat.Custom:
            return Qt.formatDate(date, customFormat);
        case Enums.DateFormat.SystemDefault:
        default:
            return Qt.formatDate(date);
        }
    }

    function formatUtcOffset(minutes: int) : string {
        const sign = minutes >= 0 ? "+" : "-";
        const abs = Math.abs(minutes);
        const hours = Math.floor(abs / 60);
        const mins = abs % 60;
        if (mins === 0)
            return `UTC${sign}${hours}:00`;

        // pad minutes with leading zero if needed
        const mm = mins < 10 ? "0" + mins : mins;
        return `UTC${sign}${hours}:${mm}`;
    }

}
