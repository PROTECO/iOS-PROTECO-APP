// Dependencies
import SwiftUI

struct CustomButtonModel {
    var backgroundColor : Color?
    var foregroundColor : Color
    var customBgColor   : Color?
}

enum TypesButtonStyle {
    case main
    case mainV2
    case secondary
    case tertiary
    case transparent
    case danger
    case success
    case disable
    case dark
    case blue
    case pink
    case unfilled
    case unfilledDark
    
    var model: CustomButtonModel {
        switch self {
        case .main:
            return CustomButtonModel(
                backgroundColor: Color("color_main"),
                foregroundColor: Color("color_light_1")
            )
        case .mainV2:
            return CustomButtonModel(
                backgroundColor: Color("color_main_2"),
                foregroundColor: Color("color_secondary_2")
            )
        case .secondary:
            return CustomButtonModel(
                backgroundColor: Color("color_secondary"),
                foregroundColor: Color("color_dark_1")
            )
        case .tertiary:
            return CustomButtonModel(
                backgroundColor: Color("color_dark_1"),
                foregroundColor: Color("color_light_1")
            )
        case .transparent:
            return CustomButtonModel(
                backgroundColor: Color("color_light_1"),
                foregroundColor: Color("color_dark_1")
            )
        case .danger:
            return CustomButtonModel(
                backgroundColor: Color("color_dangerous"),
                foregroundColor: Color("color_secondary")
            )
        case .success:
            return CustomButtonModel(
                backgroundColor: Color("color_success"),
                foregroundColor: Color("color_dark_1")
            )
        case .disable:
            return CustomButtonModel(
                backgroundColor: Color("color_light_2"),
                foregroundColor: Color("color_main")
            )
        case .dark:
            return CustomButtonModel(
                backgroundColor: Color("color_dark_1"),
                foregroundColor: Color("color_secondary")
            )
        case .blue:
            return CustomButtonModel(
                backgroundColor: Color("color_bg_darkblue"),
                foregroundColor: Color("color_secondary")
            )
        case .pink:
            return CustomButtonModel(
                backgroundColor: Color("color_bg_pink"),
                foregroundColor: Color("color_secondary")
            )
        case .unfilled:
            return CustomButtonModel(
                foregroundColor: Color("color_dark_1")
            )
        case .unfilledDark:
            return CustomButtonModel(
                foregroundColor: Color("color_dark")
            )
        }
    }
}
