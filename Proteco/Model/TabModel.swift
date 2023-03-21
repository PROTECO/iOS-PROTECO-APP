// Dependencies
import SwiftUI

struct TabItem: Identifiable {
    var id   = UUID()
    var text : String
    var icon : String
    var tab  : TabModel
}

var tabItems = [
    TabItem(text: "Asesorias", icon: "calendar.circle", tab: .advices),
    TabItem(text: "Cursos", icon: "rectangle.stack.badge.person.crop", tab: .courses),
    TabItem(text: "Inicio", icon: "house", tab: .home),
    TabItem(text: "Talleres", icon: "text.book.closed", tab: .workshops),
    TabItem(text: "Cuenta", icon: "person.circle", tab: .account),
]

enum TabModel: String, CaseIterable {
    case advices    = "calendar.circle"
    case courses    = "rectangle.stack.badge.person.crop"
    case home       = "house"
    case workshops  = "text.book.closed"
    case account    = "person.circle"
}
