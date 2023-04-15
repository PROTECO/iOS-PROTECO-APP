// Dependencies
import SwiftUI

struct NavAppearanceModifier: ViewModifier {
    init(
        backgroundColor: UIColor,
        foregroundColor: UIColor,
        tintColor: UIColor?,
        hideSeparator: Bool
    ) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titleTextAttributes = [
            .foregroundColor: foregroundColor
        ]
        navBarAppearance.largeTitleTextAttributes = [
            .font: UIFont(name: "MontserratAlternates-Bold", size: 30)!,
            .foregroundColor: foregroundColor,
            .paragraphStyle: paragraphStyle
        ]
        navBarAppearance.backgroundColor = backgroundColor
        
        if hideSeparator {
            navBarAppearance.shadowColor = .clear
        }
        
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        if tintColor != nil {
            UINavigationBar.appearance().tintColor = tintColor!
        }
    }
    
    func body(content: Content) -> some View {
        content
    }
}

extension View {
    func navigationAppearance(
        backgroundColor: UIColor,
        foregroundColor: UIColor,
        tintColor: UIColor? = nil,
        hideSeparator: Bool = false
    ) -> some View {
        self.modifier(NavAppearanceModifier(
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            tintColor: tintColor,
            hideSeparator: hideSeparator)
        )
    }
}
