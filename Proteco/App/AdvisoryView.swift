// Dependencies
import SwiftUI

struct AdvisoryView: View {
    // MARK: - PROPERTIES
    var title       : String = "Opciones de Asesoría"
    var description : String = "Selecciona alguna de las siguientes opciones:"
    
    // MARK: - BODY
    var body: some View {
        ZStack(alignment: .top) {
            VStack(alignment: .center, spacing: 30) {
                // NAVBAR
                Spacer()
                    .frame(height: 40)
                
                // TITLE
                Text(title)
                    .font(.custom("MontserratAlternates-Bold", size: 30))
                    .foregroundColor(Color("AccentColor"))
                    .multilineTextAlignment(.center)
                
                VStack(alignment: .leading, spacing: 20) {
                    // MESSAGGE
                    Text(description)
                        .font(.custom("MontserratAlternates-Regular", size: 14))
                        .foregroundColor(Color("color_dark_1"))
                        .multilineTextAlignment(.leading)
                    
                    // OPTIONS
                    AdvisoryScheduleCardView(advisoryContent: advisoryData[0])
                    AdvisoryAdminCardView(advisoryContent: advisoryData[1])
                }
                
            } //: VSTACK
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.horizontal, 20)
        } //: ZSTACK
        .edgesIgnoringSafeArea(.horizontal)
    }
}

// MARK: - PREVIEW
struct AdvisoryView_Previews: PreviewProvider {
    static var previews: some View {
        AdvisoryView()
    }
}
