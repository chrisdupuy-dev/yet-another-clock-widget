import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import org.kde.kcmutils as KCM
import org.kde.kirigami as Kirigami

KCM.SimpleKCM {
    id: misc

    property alias cfg_intervalRate: intervalRateSpinBox.value

    Kirigami.FormLayout {
        RowLayout {
            Kirigami.FormData.label: i18n("Label refresh interval (ms):")

            SpinBox {
                id: intervalRateSpinBox

                from: 1000
                value: 1000
                to: 60000
                stepSize: 1000
                editable: true
            }

            Kirigami.ContextualHelpButton {
                toolTipText: i18n("Refresh rates of labels can have a negative performance impact, adjust value higher if required but be aware displaying 'seconds' will cease to be accurate.")
            }
        }
    }

}
