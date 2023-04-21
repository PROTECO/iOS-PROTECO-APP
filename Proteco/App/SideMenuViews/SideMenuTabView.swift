// Dependencies
import SwiftUI

struct ControlView: View {
    // MARK: - PROPERTIES
    //@ObservedObject var mainObservable : MainObservable
    
    @Binding var selectedTab: String
    
    // MARK: - INIT
    init(selectedTab: Binding<String>) {
        self._selectedTab = selectedTab
        UITabBar.appearance().isHidden = true
    }
    
    // MARK: - BODY
    var body: some View {
        TabView(selection: $selectedTab) {
            // VIEWS
//            HomeView(mainObservable: <#MainObservable#>)
//                .tag("Home")
            
            ContactView()
                .tag("Contact")
            
            FeedbackView()
                .tag("Feedback")
            
            WebSiteView()
                .tag("Website")
            
            CreditsView()
                .tag("Creditos")
        }
    }
}

// MARK: - PREVIEW
//struct ControlView_Previews: PreviewProvider {
//    static var previews: some View {
//        CallView()
//    }
//}
