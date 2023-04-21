// Dependencies
import SwiftUI

struct SideMenuTabView: View {
    // MARK: - PROPERTIES
    @ObservedObject var mainObservable  : MainObservable
    @Binding        var selectedTab     : String
    
    var overlayView : OverlayView

    // MARK: - INIT
    init(mainObservable: MainObservable, selectedTab: Binding<String>) {
        self.mainObservable = mainObservable
        self._selectedTab   = selectedTab
        self.overlayView    = OverlayView(mainObservable: mainObservable)
        UITabBar.appearance().isHidden = true
    }
    
    // MARK: - BODY
    var body: some View {
        let tabViews = Group {
            switch selectedTab {
            case "Home":
                TabBarView(mainObservable: mainObservable)
                    .tag("Home")
            case "Call":
                CallView()
                    .tag("Call")
            case "Contact":
                ContactView()
                    .tag("Contact")
            case "Feedback":
                FeedbackView()
                    .tag("Feedback")
            case "Website":
                WebSiteView()
                    .tag("Credits")
            case "Credits":
                CreditsView()
                    .tag("Credits")
            default:
                TabBarView(mainObservable: mainObservable)
                    .tag("Home")
            } //: GROUP
        } //: VIEWS

        TabView {
            // SPECIAL CASE FOR HOME TAB
            tabViews
                .overlay(mainObservable.isShowSideMenu ? overlayView : nil)
                .onAppear(perform: {
                    // ENABLED SIDE MENU
                    mainObservable.isEnabledSideMenu = true
                    
                    withAnimation {
                        mainObservable.isShowSideMenu = false
                        mainObservable.isShowTabBar = selectedTab == "Home" ? true : false
                    }
                })
        }
    }
}

// MARK: - PREVIEW
struct SideMenuTabView_Previews: PreviewProvider {
    @State static private var option: String = "Home"
    
    static var previews: some View {
        SideMenuTabView(mainObservable: MainObservable(), selectedTab: $option)
    }
}

struct PruebaView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            Text("PruebaView")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("PruebaView")
        }
    }
}
