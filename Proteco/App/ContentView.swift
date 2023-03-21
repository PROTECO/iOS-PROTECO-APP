// Dependencies
import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
                .font(.custom("MontserratAlternates-Medium" , size: 32))
            Text("since Swift UI")
                .font(.custom("Assistant-Light" , size: 16))
        } //: VSTACK
        .padding()
    } //: BODY
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
}
