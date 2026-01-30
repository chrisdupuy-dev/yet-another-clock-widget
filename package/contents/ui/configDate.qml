import QtQuick 2.0
import QtQuick.Layouts
import QtQuick.Controls 2.0
import org.kde.kirigami 2.5 as Kirigami
import org.kde.kcmutils as KCM

import "components"

KCM.SimpleKCM {
    id: appearance

    property alias cfg_showDate: showDateCheckBox.checked
    property alias cfg_dateIsGlobalStyled: dateIsGlobalStyled.checked

    property alias cfg_dateTextColor: styledLabelConfig.colorText
    property alias cfg_dateTextColorButton: styledLabelConfig.colorButton
    property alias cfg_dateFontFamily: styledLabelConfig.fontFamily
    property alias cfg_dateFontPointSize: styledLabelConfig.fontPointSize
    property alias cfg_dateFontStyleName: styledLabelConfig.fontStyleName
    property alias cfg_dateFontStrikeout: styledLabelConfig.fontStrikeout
    property alias cfg_dateFontUnderline: styledLabelConfig.fontUnderline
    property alias cfg_dateStrokeEnabled: styledLabelConfig.strokeEnabled
    property alias cfg_dateStrokeSize: styledLabelConfig.strokeSize
    property alias cfg_dateStrokeColorText: styledLabelConfig.strokeColorText
    property alias cfg_dateStrokeColorButton: styledLabelConfig.strokeColorButton
    property alias cfg_dateDropShadowEnabled: styledLabelConfig.dropShadowEnabled
    property alias cfg_dateDropShadowColorText: styledLabelConfig.dropShadowColorText
    property alias cfg_dateDropShadowColorButton: styledLabelConfig.dropShadowColorButton

    ColumnLayout {
        Kirigami.FormLayout {
            id: dateFormatLayout
            twinFormLayouts: [styledLabelConfig]

            CheckBox {
                id: showDateCheckBox
                Kirigami.FormData.label: "Show date:"
            }
            
            CheckBox {
                id: dateIsGlobalStyled
                Kirigami.FormData.label: "Use global style:"
            }
        }

        StyledLabelConfig {
            id: styledLabelConfig
            enabled: !dateIsGlobalStyled.checked
            twinFormLayouts: [dateFormatLayout]
        }
    }
}
