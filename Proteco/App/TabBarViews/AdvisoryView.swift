// Dependencies
import SwiftUI

struct AdvisoryView: View {
    // MARK: - PROPERTIES
    @ObservedObject var mainObservable : MainObservable
    
    @State var showDetail   : Bool = false
    @State var gridLayout   : [GridItem]    = [ GridItem(.flexible()) ]
    @State var gridColumn   : Int           = 1
    
    var title       : String = "Opciones de Asesoría"
    var description : String = "Selecciona alguna de las siguientes opciones:"
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(
                    columns: gridLayout,
                    alignment: .leading,
                    spacing: 20
                ) {
                    // DESCRIPTION
                    Text(description)
                        .font(.custom("MontserratAlternates-Regular", size: 14))
                        .foregroundColor(Color("color_dark_1"))
                        .multilineTextAlignment(.leading)
                    
                    // CARD: ADVISORY SCHEDULE
                    NavigationLink(
                        destination: AdvisoryScheduleView(mainObservable: mainObservable)
                    ) {
                        AdvisoryScheduleCardView(advisoryContent: advisoryData[0])
                            .frame(height: 150)
                    } //: LINK
                    
                    // CARD: ADVISORY ADMIN
                    NavigationLink(
                        destination: AdvisoryAdminView(mainObservable: mainObservable)
                    ) {
                        AdvisoryAdminCardView(advisoryContent: advisoryData[1])
                            .frame(height: 150)
                    } //: LINK
                } //: GRID
                .padding(20)
                .navigationBarTitle(
                    Text(title),
                    displayMode: .large
                )
                .navigationBarTitleDisplayMode(.large)
            } //: SCROLL
            .onAppear {
                UITableView.appearance().separatorStyle = .none
            } //: NAVIGATION
            .navigationAppearance(
                backgroundColor: UIColor(Color("color_light_1")),
                foregroundColor: UIColor(Color("AccentColor")),
                tintColor: UIColor(Color("AccentColor")),
                hideSeparator: true
            )
        }
    } //: NAVIGATION
}

// MARK: - PREVIEW
struct AdvisoryView_Previews: PreviewProvider {
    static var previews: some View {
        AdvisoryView(mainObservable: MainObservable())
    }
}
