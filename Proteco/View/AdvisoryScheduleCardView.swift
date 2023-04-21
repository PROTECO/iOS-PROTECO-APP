// Dependencies
import SwiftUI

struct AdvisoryScheduleCardView: View {
    // MARK: - PROPERTIES
    var advisoryContent : Advisory
    
    // MARK: - BODY
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(advisoryContent.image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 120)
            
            HStack(alignment: .bottom) {
                Spacer()
                    .frame(width: 100)
                
                VStack(alignment: .leading, spacing: 10) {
                    Spacer()
                        .frame(height: 10)
                    
                    Text(advisoryContent.title)
                        .font(.custom("MontserratAlternates-Bold" , size: 20))
                        .foregroundColor(Color("color_dark"))
                    
                    TextView(text: advisoryContent.description)
                        .font(.custom("MontserratAlternates-Regular" , size: 12))
                        .frame(maxHeight: 80)
                } //: VSTACK
            } //: HSTACK
            .padding(.horizontal, 10)
            .frame(maxHeight: 170)
        } //: ZSTACK
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 10)
        .background(advisoryContent.bgColor)
        .cornerRadius(20)
        .modifier(ShadowView(isShadow: true))
    }
}

// MARK: - PREVIEW
struct AdvisoryScheduleCardView_Previews: PreviewProvider {
    static var previews: some View {
        AdvisoryScheduleCardView(advisoryContent: advisoryData[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
