import QtQuick 2.0
import QtQuick.Controls 2.0
import org.kde.kirigami 2.5 as Kirigami
import org.kde.kcmutils as KCM

KCM.SimpleKCM {
    property alias cfg_showDate: showDateCheckBox.checked

    Kirigami.FormLayout {
        CheckBox {
            id: showDateCheckBox
            text: i18n("Show date")
        }
    }
}
