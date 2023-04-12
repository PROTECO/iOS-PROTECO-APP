// Dependencies
import SwiftUI

struct AdvisoryAdminCardView: View {
    // MARK: - PROPERTIES
    var advisoryContent : Advisory
    
    // MARK: - BODY
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image(advisoryContent.image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 120)
            
            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 10) {
                    Spacer()
                        .frame(height: 10)
                    
                    Text("Administra tus asesorias")
                        .font(.custom("MontserratAlternates-Bold" , size: 20))
                        .foregroundColor(Color("color_dark"))
                        .frame(maxWidth: 270)
                    
                    TextView(text: advisoryContent.description)
                        .font(.custom("MontserratAlternates-Regular" , size: 12))
                        .frame(maxWidth: 270, maxHeight: 80)
                } //: VSTACK
                
                Spacer()
                    .frame(width: 80)
            } //: HSTACK
            .frame(maxWidth: .infinity, maxHeight: 170)
        } //: ZSTACK
        .frame(maxWidth: .infinity)
        .background(advisoryContent.bgColor)
        .cornerRadius(20)
        .modifier(ShadowView(isShadow: true))
    }
}

// MARK: - PREVIEW
struct AdvisoryAdminCardView_Previews: PreviewProvider {
    static var previews: some View {
        AdvisoryAdminCardView(advisoryContent: advisoryData[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
