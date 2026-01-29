import QtQuick 2.0
import QtQuick.Layouts
import QtQuick.Controls 2.0
import org.kde.kirigami 2.5 as Kirigami
import org.kde.kcmutils as KCM

import "components"

KCM.SimpleKCM {
    id: appearance

    property alias cfg_globalTextColor: styledLabelConfig.colorText
    property alias cfg_globalTextColorButton: styledLabelConfig.colorButton
    property alias cfg_globalFontFamily: styledLabelConfig.fontFamily
    property alias cfg_globalFontPointSize: styledLabelConfig.fontPointSize
    property alias cfg_globalFontStyleName: styledLabelConfig.fontStyleName
    property alias cfg_globalFontStrikeout: styledLabelConfig.fontStrikeout
    property alias cfg_globalFontUnderline: styledLabelConfig.fontUnderline
    property alias cfg_globalStrokeEnabled: styledLabelConfig.strokeEnabled
    property alias cfg_globalStrokeSize: styledLabelConfig.strokeSize
    property alias cfg_globalStrokeColorText: styledLabelConfig.strokeColorText
    property alias cfg_globalStrokeColorButton: styledLabelConfig.strokeColorButton
    property alias cfg_globalDropShadowEnabled: styledLabelConfig.dropShadowEnabled
    property alias cfg_globalDropShadowColorText: styledLabelConfig.dropShadowColorText
    property alias cfg_globalDropShadowColorButton: styledLabelConfig.dropShadowColorButton

    property alias cfg_showDate: showDateCheckBox.checked

    ColumnLayout {
        Kirigami.FormLayout {
            Kirigami.FormData.label: "Text appearance settings"
            twinFormLayouts: [styledLabelConfig]

            CheckBox {
                id: showDateCheckBox
                Kirigami.FormData.label: "Show date:"
            }
        }

        StyledLabelConfig {
            id: styledLabelConfig
        }
    }
}
