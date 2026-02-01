pragma Singleton
import QtQuick

QtObject {
    function formatTime(date: date, timeFormat: int, formatSeconds: bool): string {
        const locale = Qt.locale();

        let format = locale.timeFormat(Locale.ShortFormat);

        if (timeFormat === Enums.TimeFormat.SystemDefault) {
            if (formatSeconds) {
                const colonIndex = format.indexOf(":");
                const insertAt = colonIndex + 3;

                format = format.slice(0, insertAt)
                    + ":ss"
                    + format.slice(insertAt);
            }
            
            return Qt.formatTime(date, format);
        }

        const seconds = formatSeconds ? ":ss" : ""

        if (timeFormat === Enums.TimeFormat.TwelveHour) {
            format = `h:mm${seconds} AP`
        } else if (timeFormat === Enums.TimeFormat.TwentyFourHour) {
            format = `HH:mm${seconds}`
        }

        return Qt.formatTime(date, format);
    }
}