import QtQuick 2.0
import QtQuick.Controls 2.0
import org.kde.kcmutils as KCM
import org.kde.kirigami 2.5 as Kirigami

KCM.SimpleKCM {
    id: misc

    property alias cfg_intervalRate: intervalRateSpinBox.value

    Kirigami.FormLayout {
        SpinBox {
            id: intervalRateSpinBox

            Kirigami.FormData.label: i18n("Label refresh interval (ms):")
            from: 1000
            value: 1000
            to: 30000
            stepSize: 1000
            editable: true
        }

    }

}
