// Dependencies
import SwiftUI

// MARK: - ADVISORY DATA MODEL:
struct Advisory: Identifiable {
    var id              = UUID()
    var image           : String
    var bgColor         : Color
    var title           : String
    var description     : String
}
