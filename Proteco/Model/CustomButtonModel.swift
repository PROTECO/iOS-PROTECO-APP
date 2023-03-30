// Dependencies
import SwiftUI

struct CustomButton {
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
    
    var model: CustomButton {
        switch self {
        case .main:
            return CustomButton(
                backgroundColor: Color("color_main"),
                foregroundColor: Color("color_light_1")
            )
        case .mainV2:
            return CustomButton(
                backgroundColor: Color("color_main_2"),
                foregroundColor: Color("color_secondary_2")
            )
        case .secondary:
            return CustomButton(
                backgroundColor: Color("color_secondary"),
                foregroundColor: Color("color_dark_1")
            )
        case .tertiary:
            return CustomButton(
                backgroundColor: Color("color_dark_1"),
                foregroundColor: Color("color_light_1")
            )
            
        case .transparent:
            return CustomButton(
                backgroundColor: Color("color_light_1"),
                foregroundColor: Color("color_dark_1")
            )
            
        case .danger:
            return CustomButton(
                backgroundColor: Color("color_dangerous"),
                foregroundColor: Color("color_secondary")
            )
            
        case .success:
            return CustomButton(
                backgroundColor: Color("color_success"),
                foregroundColor: Color("color_dark_1")
            )
            
        case .disable:
            return CustomButton(
                backgroundColor: Color("color_light_2"),
                foregroundColor: Color("color_main")
            )
            
        case .dark:
            return CustomButton(
                backgroundColor: Color("color_dark_1"),
                foregroundColor: Color("color_secondary")
            )
            
        case .blue:
            return CustomButton(
                backgroundColor: Color("color_bg_darkblue"),
                foregroundColor: Color("color_secondary")
            )
            
        case .pink:
            return CustomButton(
                backgroundColor: Color("color_bg_pink"),
                foregroundColor: Color("color_secondary")
            )
            
        case .unfilled:
            return CustomButton(
                foregroundColor: Color("color_dark_1")
            )
        }
    }
}
