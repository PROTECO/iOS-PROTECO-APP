// Dependencies
import SwiftUI

struct MenuView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .background(Color("color_bg_green"))
    }
}

// MARK: - PREVIEW
struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
