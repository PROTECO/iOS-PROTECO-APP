// Dependencies
import SwiftUI

struct CustomCorner: Shape {
    // MARK: - PROPERTIES
    var corners : UIRectCorner
    var radius  : CGFloat
    
    // MARK: - FUNCTIONS
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        
        return Path(path.cgPath)
    }
}
