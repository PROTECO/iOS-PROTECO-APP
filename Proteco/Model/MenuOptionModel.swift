// Dependencies
import SwiftUI

struct MenuOptionItem : Identifiable {
    var id      = UUID()
    var selected: String
    var text    : String
    var icon    : String
    var tab     : MenuOptionModel
}

var menuItems = [
    MenuOptionItem(selected: "Home", text: "Inicio", icon: "house", tab: .home),
    MenuOptionItem(selected: "Call", text: "Convocatoria", icon: "person.wave.2", tab: .call),
    MenuOptionItem(selected: "Contact", text: "Contacto", icon: "signpost.right", tab: .contact),
    MenuOptionItem(selected: "Feedback", text: "Feedback", icon: "square.and.pencil.circle", tab: .feedback),
    MenuOptionItem(selected: "Website", text: "Sitio web", icon: "link.circle", tab: .website),
    MenuOptionItem(selected: "Credits", text: "Créditos", icon: "hands.sparkles", tab: .credits),
    MenuOptionItem(selected: "Logout", text: "Cerrar sesión", icon: "rectangle.righthalf.inset.fill.arrow.right", tab: .logout),
]

enum MenuOptionModel: String, CaseIterable {
    case home       = "Home"
    case call       = "Call"
    case contact    = "Contact"
    case feedback   = "Feedback"
    case website    = "Website"
    case credits    = "Credits"
    case logout     = "Logout"
}
