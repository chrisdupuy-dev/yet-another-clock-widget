pragma ComponentBehavior: Bound

import QtQuick 2.0
import QtQuick.Controls 2.0

SpinBox {
    id: spinBox

    property int decimals: 2

    validator: DoubleValidator {
        bottom: Math.min(spinBox.from, spinBox.to)
        top: Math.max(spinBox.from, spinBox.to)
        decimals: spinBox.decimals
        notation: DoubleValidator.StandardNotation
    }

    textFromValue: function (value, locale) {
        return Number(value).toLocaleString(locale, 'f', spinBox.decimals);
    }

    valueFromText: function (text, locale) {
        return Math.round(Number.fromLocaleString(locale, text));
    }
}
