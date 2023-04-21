// Dependencies
import SwiftUI

struct WebSiteView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            Text("Web Site")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Web Site")
        }
    }
}

// MARK: - PREVIEW
struct WebSiteView_Previews: PreviewProvider {
    static var previews: some View {
        WebSiteView()
    }
}
