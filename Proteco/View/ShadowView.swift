// Dependencies
import SwiftUI

struct ShadowView: ViewModifier {
    // MARK: - BODY
    func body(content: Content) -> some View {
        content
            .shadow(color: Color("color_light"), radius: 2, x: 0, y: 4)
            .shadow(color: Color("color_dark"), radius: 2, x: 2, y: 2)
    }
}
