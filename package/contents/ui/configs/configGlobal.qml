import "../components"
import QtQuick
import QtQuick.Layouts
import org.kde.kcmutils as KCM

KCM.SimpleKCM {
    id: globalAppearance

    property alias cfg_globalTextColor: styledLabelConfig.colorText
    property alias cfg_globalTextColorButton: styledLabelConfig.colorButton
    property alias cfg_globalFontFamily: styledLabelConfig.fontFamily
    property alias cfg_globalFontPointSize: styledLabelConfig.fontPointSize
    property alias cfg_globalFontStyleName: styledLabelConfig.fontStyleName
    property alias cfg_globalFontStrikeout: styledLabelConfig.fontStrikeout
    property alias cfg_globalFontUnderline: styledLabelConfig.fontUnderline
    property alias cfg_globalStrokeEnabled: styledLabelConfig.strokeEnabled
    property alias cfg_globalStrokeColorText: styledLabelConfig.strokeColorText
    property alias cfg_globalStrokeColorButton: styledLabelConfig.strokeColorButton
    property alias cfg_globalBlurEnabled: styledLabelConfig.blurEnabled
    property alias cfg_globalBlur: styledLabelConfig.blur
    property alias cfg_globalBlurMax: styledLabelConfig.blurMax
    property alias cfg_globalBlurMultiplier: styledLabelConfig.blurMultiplier
    property alias cfg_globalDropShadowEnabled: styledLabelConfig.dropShadowEnabled
    property alias cfg_globalDropShadowOpacity: styledLabelConfig.dropShadowOpacity
    property alias cfg_globalDropShadowBlur: styledLabelConfig.dropShadowBlur
    property alias cfg_globalDropShadowScale: styledLabelConfig.dropShadowScale
    property alias cfg_globalDropShadowHorizontalOffset: styledLabelConfig.dropShadowHorizontalOffset
    property alias cfg_globalDropShadowVerticalOffset: styledLabelConfig.dropShadowVerticalOffset
    property alias cfg_globalDropShadowColorText: styledLabelConfig.dropShadowColorText
    property alias cfg_globalDropShadowColorButton: styledLabelConfig.dropShadowColorButton

    ColumnLayout {
        StyledLabelConfig {
            id: styledLabelConfig
        }

    }

}
