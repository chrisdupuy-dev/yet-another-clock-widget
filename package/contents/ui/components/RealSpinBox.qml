import QtQuick 2.0
import QtQuick.Controls 2.0

SpinBox {
    id: spinBox
    stepSize: decimalFactor
    editable: true
    from: decimalToInt(realFrom)
    value: decimalToInt(realValue)
    to: decimalToInt(realTo)

    property real realFrom: 0.00
    property real realTo: 100.00
    property real realValue: value / decimalFactor

    readonly property int decimals: 2
    readonly property int decimalFactor: Math.pow(10, decimals)
    
    function decimalToInt(decimal) {
        return decimal * decimalFactor
    }

    textFromValue: function(value, locale) {
        return Number(value / decimalFactor).toLocaleString(undefined, {
            minimumFractionDigits: spinBox.decimals,
            maximumFractionDigits: spinBox.decimals
        })
    }

    valueFromText: function(text, locale) {
        if (text.endsWith(locale === "de_DE" ? "," : ".")) {
            return spinBox.value;
        }

        return Math.round(
            Number.fromLocaleString(locale, text) * decimalFactor
        );
    }

    validator: DoubleValidator {
        bottom: Math.min(spinBox.from, spinBox.to)
        top: Math.max(spinBox.from, spinBox.to)
        decimals: spinBox.decimals
        notation: DoubleValidator.StandardNotation
    }
    
}
