// Dependencies
import SwiftUI

class MainObservable: ObservableObject {
    // MARK: - PROPERTIES
    @Published var showMenu: Bool = true
    
    // MARK: - FUNCTIONS
    func toogleShowMenu() {
        DispatchQueue.main.async {
            self.showMenu.toggle()
            print("ShowMenu: \(self.showMenu)")
        }
    }
}

struct MainView: View {
    // MARK: - PROPERTIES
    @StateObject var mainObservable = MainObservable()
    
    @State var isAnimating  : Bool      = false
    @State var selectedTab  : TabModel  = .home
    @State var color        : Color     = Color("color_icons")
    
    private var shadow = ShadowView(isShadow: true)
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    // MARK: - BODY
    var body: some View {
        // VIEWS
        let tabViews = Group {
            switch selectedTab {
            case .advices:
                AdvisoryView(mainObservable: mainObservable)
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
        
        ZStack {
            // CONTENT
            tabViews
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            VStack {
                // NAVIGATION BAR
                ZStack {
                    if (mainObservable.showMenu) {
                        NavigationBarView()
                    }
                } //: ZSTACK
                .frame(width: nil, height: 90, alignment: .bottom)
                .animation(.easeIn(duration: 0.1), value: self.mainObservable.showMenu)
                .ignoresSafeArea()
                
                Spacer()
                
                // TAB BAR
                ZStack  {
                    if (mainObservable.showMenu) {
                        HStack(spacing: 0) {
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
                    }
                } //: ZSTACK
                .animation(.easeIn(duration: 0.1), value: self.mainObservable.showMenu)
            } //: VSTACK
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
