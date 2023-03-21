// Dependencies
import SwiftUI

struct MainView: View {
    // MARK: - PROPERTIES
    @State var selectedTab: TabModel = .home
    @State var color: Color = Color("color_icons")
    
    private var shadow = ShadowView()
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    // MARK: - BODY
    var body: some View {
        // VIEWS
        let tabViews = Group {
            switch selectedTab {
            case .advices:
                Text("Asesorias")
            case .courses:
                Text("Cursos")
            case .home:
                Text("Inicio")
            case .workshops:
                Text("Talleres")
            case .account:
                Text("Cuenta")
            } //: GROUP
        } //: VIEWS
        
        ZStack(alignment: .bottom) {
            tabViews
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            HStack(spacing: 0) {
                Spacer()
                ForEach(tabItems) { item in
                    Button {
                        withAnimation(
                            .spring(
                                response: 0.3,
                                dampingFraction: 0.7
                            )
                        ) {
                            selectedTab = item.tab
                        }
                    } label: {
                        VStack(spacing: 0) {
                            Image(systemName: selectedTab == item.tab ? fillImage : item.icon)
                                .font(.body.bold())
                                .frame(width: 44, height: 45)
                                .scaleEffect(selectedTab == item.tab ? 2 : 1.5)
                                .foregroundColor(selectedTab == item.tab ? Color("color_secondary") : Color("color_icons"))
                                .padding(.bottom, 2)
                            
                            Text(item.text)
                                .font(selectedTab == item.tab ? .custom("MontserratAlternates-SemiBold", size: 10) : .custom("MontserratAlternates-Regular", size: 11))
                                .lineLimit(1)
                                .scaleEffect(selectedTab == item.tab ? 1.2 : 1)
                                .foregroundColor(selectedTab == item.tab ? Color("color_secondary") : Color("color_icons"))
                        } //: VSTACK
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 15)
                    } //: LABEL
                } //: FOREACH
                Spacer()
            } //: HSTACK
            .frame(width: nil, height: 90, alignment: .bottom)
            .background(Color("color_main"))
            .cornerRadius(30)
            .modifier(shadow)
            .padding(.leading, 15)
            .padding(.trailing, 15)
            .ignoresSafeArea()
        } //: ZSTACK
    }
}


// MARK: - PREVIEW
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewDevice("iPhone 11")
    }
}
