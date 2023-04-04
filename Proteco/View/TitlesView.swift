// Dependencies
import SwiftUI

struct TitlesView: View {
    // MARK: - PROPERTIES
    var title       : String
    var description : String?
    var fgColorTitle: Color?
    var fgColorDesc : Color?
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 0) {
            Text(title)
                .font(.custom("MontserratAlternates-Bold" , size: 35))
                .foregroundColor(fgColorTitle != nil ? fgColorTitle! : Color("color_dark"))
            
            Text(description != nil ? description! : "")
                .font(.custom("Assistant-Regular" , size: 18))
                .foregroundColor(fgColorDesc != nil ? fgColorDesc! : Color("color_dark"))
        } //: VSTACK
    }
}

// MARK: - PREVIEW
struct TitlesView_Previews: PreviewProvider {
    static var previews: some View {
        TitlesView(title: "Testing", description: "Hello world!", fgColorTitle: Color("color_main"))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
