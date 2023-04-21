// Dependencies
import SwiftUI

struct SideMenuControlView: View {
    // MARK: - PROPERTIES
    @ObservedObject var mainObservable  : MainObservable
    @Binding        var selectedTab     : String
    @GestureState   var menuOffset      : CGFloat = 0
    @State          var offset          : CGFloat = 0
    @State          var lastStoredOffset: CGFloat = 0
    @State          var scale           : CGFloat = 1
    @State          var lastStoredScale : CGFloat = 0
    
    // MARK: - FUNCTIONS
    func onEnd(value: DragGesture.Value) {
        let sideBarWidth    = getRect().width - 160
        let translation     = value.translation.width
    
        if mainObservable.isEnabledSideMenu {
            withAnimation {
                if translation > 0 {
                    // SHOWING MENU
                    if translation > (sideBarWidth / 2) {
                        offset = sideBarWidth
                        scale = 0.8
                        mainObservable.isShowSideMenu = true
                        mainObservable.isShowTabBar = false
                    }
                    // HIDE MENU
                    else {
                        offset = 0
                        scale = 1
                        mainObservable.isShowSideMenu = false
                        mainObservable.isShowTabBar = mainObservable.selectedMenu == "Home" ? true : false
                    }
                } else {
                    if -translation > (sideBarWidth / 2) {
                        offset = 0
                        scale = 1
                        mainObservable.isShowSideMenu = false
                        mainObservable.isShowTabBar = mainObservable.selectedMenu == "Home" ? true : false
                    }
                }
            }
        }
        
        // PRINT INFO ABOUT EACH DATA UX
        //        print("sideBarWidth / 2: \(sideBarWidth / 2)")
        //        print("Translation end: \(translation) \n")
        //        print("selectedTab: \(mainObservable.selectedMenu)")
        
        // STORING LAST OFFSET & SCALE
        lastStoredOffset = offset
        lastStoredScale = scale
    }
    
    func onChange() {
        let sideBarWidth    = getRect().width - 160
        let modifierScale   = 0.00787
        let currentOffset   = menuOffset + lastStoredOffset
        let currentScale    = (modifierScale * currentOffset) / 10
        
        if mainObservable.isEnabledSideMenu {
            offset = (menuOffset != 0) ? (currentOffset < sideBarWidth ? currentOffset : sideBarWidth) : offset
            scale  = (menuOffset != 0) ? (currentScale <= 0.2 ? (1 - currentScale) : 0.8 - currentScale) : scale
            mainObservable.isShowTabBar = selectedTab == "Home" ? (offset > 0 ? false : true) : false
        }
        
        // PRINT INFO ABOUT EACH DATA UX
        //        print("MenuOffset: \(menuOffset)")
        //        print("GetRect().width: \(getRect().width)")
        //        print("SideBarWidth: \(sideBarWidth)")
        //        print("Offset: \(offset)")
        //        print("CurrentOffset: \(currentOffset)")
        //        print("Scale: \(scale)")
        //        print("CurrentScale: \(currentScale) \n")
    }
    
    // MARK: - BODY
    var body: some View {
        // MARK: - LOCAL PROPERTIES
        let sideBarWidth = getRect().width - 160
        let maxScale     = 0.8
        
        ZStack {
            // TWO BACKGROUND CARDS
            Color("color_light_1")
                .opacity(0.5)
                .cornerRadius(mainObservable.isShowSideMenu ? 15 : 0)
                .shadow(
                    color: Color.black.opacity(0.07),
                    radius: 5,
                    x: -5,
                    y: 0
                )
                .offset(x: mainObservable.isShowSideMenu ? -25 : 0)
                .padding(.vertical, 30)
            
            Color("color_light_1")
                .opacity(0.5)
                .cornerRadius(mainObservable.isShowSideMenu ? 15 : 0)
                .shadow(
                    color: Color.black.opacity(0.07),
                    radius: 5,
                    x: -5,
                    y: 0
                )
                .offset(x: mainObservable.isShowSideMenu ? -50 : 0)
                .padding(.vertical, 60)
            
            // SELECTED VIEW (CURRENTLY VIEW)
            SideMenuTabView(mainObservable: mainObservable, selectedTab: $selectedTab)
                .cornerRadius(mainObservable.isShowSideMenu ? 15 : 0)
        }
        // EFFECT TO SCALE SIDE MENU
        .scaleEffect(mainObservable.isShowSideMenu ? maxScale : 1)
        .scaleEffect( (scale <= 1) ? (scale > 0 ? scale : 1) : 1)
        // EFFECT TO OFFSET SIDE MENU
        .offset(x: mainObservable.isShowSideMenu ? sideBarWidth : 0)
        .offset(x: offset > 0 ? offset : 0)
        .ignoresSafeArea()
        .overlay(
            // MENU ACTION
            VStack {
                if mainObservable.isShowBtnSideMenu {
                    Button(
                        action: {
                            withAnimation(.spring()) {
                                mainObservable.isShowSideMenu.toggle()
                                mainObservable.isShowTabBar.toggle()
                            }
                        },
                        label: {
                            ZStack {
                                Rectangle()
                                    .fill(mainObservable.isShowSideMenu ? Color("color_light_1") : Color("color_dark_1"))
                                    .frame(width: mainObservable.isShowSideMenu ? 25 : 20, height: 2.5)
                                    .cornerRadius(5)
                                    .offset(x: 0, y: mainObservable.isShowSideMenu ? 0 : -8)
                                    .rotationEffect(.init(degrees: mainObservable.isShowSideMenu ? -45 : 0))
                                    .animation(.easeIn(duration: 0.3), value: mainObservable.isShowSideMenu)
                                
                                Rectangle()
                                    .fill(Color("color_dark_1"))
                                    .frame(width: 12, height: 2.5)
                                    .cornerRadius(5)
                                    .offset(x: -4, y: 0)
                                    .opacity(mainObservable.isShowSideMenu ? 0 : 1)
                                    .animation(.easeIn(duration: 0.1), value: mainObservable.isShowSideMenu)
                                
                                Rectangle()
                                    .fill(mainObservable.isShowSideMenu ? Color("color_light_1") : Color("color_dark_1"))
                                    .frame(width: mainObservable.isShowSideMenu ? 25 : 20, height: 2.5)
                                    .cornerRadius(5)
                                    .offset(x: 0, y: mainObservable.isShowSideMenu ? 0 : 8)
                                    .rotationEffect(.init(degrees: mainObservable.isShowSideMenu ? 45 : 0))
                                    .animation(.easeIn(duration: 0.3), value: mainObservable.isShowSideMenu)
                                
                            } //: ZSTACK
                            .frame(width: 25, height: 25)
                        }
                    ) //: BUTTON
                    .padding(.horizontal, 15)
                    .padding(.vertical, 5)
                }
            } //: VSTACK
            .frame(alignment: .center)
            ,alignment: .topLeading
        )
        // ADD OF FUNCTIONALITY SLIDE
        .gesture(
            DragGesture()
                .updating($menuOffset, body: { value, state, _ in
                    state = value.translation.width
                })
                .onEnded(onEnd(value:))
        )
        .animation(.easeOut, value: offset == sideBarWidth)
        .onChange(of: mainObservable.isShowSideMenu) { newValue in
            if offset == 0 {
                offset = sideBarWidth
                lastStoredOffset = offset
                scale = 0.8
            }
            
            if offset == sideBarWidth {
                offset = 0
                lastStoredOffset = offset
                scale = 1
            }
        }
        .onChange(of: menuOffset) { newValue in
            if mainObservable.isEnabledSideMenu {
                onChange()
            }
        }
    }
}

// MARK: - PREVIEW
struct SideMenuControlView_Previews: PreviewProvider {
    @State static private var option: String = "Website"
    
    static var previews: some View {
        SideMenuControlView(mainObservable: MainObservable(), selectedTab: $option)
        //MainView()
    }
}
