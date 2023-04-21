// Dependencies
import SwiftUI

struct ContactView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            Text("Contact")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Contact")
        }
    }
}

// MARK: - PREVIEW
struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
    }
}
