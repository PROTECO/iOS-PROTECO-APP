// Dependencies
import SwiftUI

struct TabBarView: View {
    // MARK: - PROPERTIES
    @ObservedObject var mainObservable : MainObservable
    
    @State var isAnimating  : Bool      = false
    @State var selectedTab  : TabModel  = .home
    @State var color        : Color     = Color("color_icons")
    
    var shadow = ShadowView(isShadow: true)
    var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    var overlayHomeView: some View {
        Rectangle()
            .fill(Color("color_light_1"))
            .ignoresSafeArea(.container, edges: .vertical)
            .onTapGesture {
                print("onTap in Overlay")
                
                // HIDDEN OF SIDE MENU
                if mainObservable.isShowSideMenu {
                    withAnimation {
                        mainObservable.isShowSideMenu.toggle()
                    }
                }
                // HIDDEN OF TAB BAR & NAV BAR
                mainObservable.isShowTabBar = mainObservable.selectedMenu == "Home" ? true : false
                
//                else {
//                    withAnimation {
//                        mainObservable.isShowTabBar.toggle()
//                    }
//                }
//                if !mainObservable.isShowTabBar {
//                    withAnimation {
//                        mainObservable.isShowTabBar.toggle()
//                    }
//                }
            }
            .opacity(0.6)
    }
    
    // MARK: - BODY
    var body: some View {
        // VIEWS
        let tabViews = Group {
            switch selectedTab {
            case .advices:
                AdvisoryView(mainObservable: mainObservable)
            case .courses:
                CoursesView()
            case .home:
                HomeView()
            case .workshops:
                WorkshopsView()
            case .account:
                AccountView()
            } //: GROUP
        } //: VIEWS
        
        ZStack(alignment: .bottom) {
            // CONTENT VIEW FOR EACH TAB OPTION
            tabViews
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                //.overlay(mainObservable.isShowSideMenu ? overlayHomeView : nil)

            ZStack  {
                if (mainObservable.isShowTabBar) {
                    // TAB BAR
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
                } //: CONDITIONAL
            } //: ZSTACK
            .animation(.easeIn(duration: 0.1), value: self.mainObservable.isShowTabBar)
        } //: ZSTACK
    }
}

// MARK: - PREVIEW
struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(mainObservable: MainObservable())
    }
}
