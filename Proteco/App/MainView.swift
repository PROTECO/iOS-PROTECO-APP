// Dependencies
import SwiftUI

class MainObservable: ObservableObject {
    // MARK: - PROPERTIES
    @Published var isShowTabBar         : Bool = true
    @Published var isShowSideMenu       : Bool = false
    @Published var isEnabledSideMenu    : Bool = true
    @Published var isShowBtnSideMenu    : Bool = true
    @Published var selectedMenu         : String = "Home"
    
    // MARK: - FUNCTIONS
}

struct MainView: View {
    // MARK: - PROPERTIES
    @StateObject var mainObservable = MainObservable()
    
    @State var isAnimating  : Bool      = false
    
    private var shadow = ShadowView(isShadow: true)
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            // TAB BAR
            TabBarView(mainObservable: mainObservable)
            
            // SIDE MENU (SELECTED OPTION)
            SideMenuView(selectedTab: $mainObservable.selectedMenu)
            
            // SIDE MENU (ALL VIEWS)
            SideMenuControlView(mainObservable: mainObservable, selectedTab: $mainObservable.selectedMenu)
            
            // NAVIGATION BAR
            NavigationBarView(mainObservable: mainObservable)
        } //: ZSTACK
    }
}

// MARK: - EXTENSIONS
extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}

// MARK: - PREVIEW
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewDevice("iPhone 11")
    }
}
