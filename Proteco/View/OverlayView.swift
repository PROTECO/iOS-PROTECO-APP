// Dependencies
import SwiftUI

struct OverlayView: View {
    // MARK: - PROPERTIES
    @ObservedObject var mainObservable : MainObservable
    
    // MARK: - BODY
    var body: some View {
        Rectangle()
            .fill(Color("color_light_1"))
            .ignoresSafeArea(.container, edges: .vertical)
            .onTapGesture {
                // HIDDEN OF SIDE MENU
                if mainObservable.isShowSideMenu {
                    withAnimation {
                        mainObservable.isShowSideMenu.toggle()
                    }
                }
                // HIDDEN OF TAB BAR & NAV BAR
                if !mainObservable.isShowTabBar {
                    withAnimation {
                        //mainObservable.isShowTabBar.toggle()
                        mainObservable.isShowTabBar = mainObservable.selectedMenu == "Home" ? true : false
                    }
                }
            }
            .opacity(0.6)
    }
}

// MARK: - PREVIEW
struct OverlayView_Previews: PreviewProvider {
    static var previews: some View {
        OverlayView(mainObservable: MainObservable())
    }
}
