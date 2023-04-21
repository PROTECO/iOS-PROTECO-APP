// Dependencies
import SwiftUI

struct SideMenuControlView: View {
    // MARK: - PROPERTIES
    @ObservedObject var mainObservable  : MainObservable
    @Binding        var selectedTab     : String
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            // TWO BACKGROUND CARDS
            Color
                .white
                .opacity(0.5)
                .cornerRadius(mainObservable.isShowMenu ? 15 : 0)
                .shadow(
                    color: Color.black.opacity(0.07),
                    radius: 5,
                    x: -5,
                    y: 0
                )
                .offset(x: mainObservable.isShowMenu ? -25 : 0)
                .padding(.vertical, 30)
            
            Color
                .white
                .opacity(0.5)
                .cornerRadius(mainObservable.isShowMenu ? 15 : 0)
                .shadow(
                    color: Color.black.opacity(0.07),
                    radius: 5,
                    x: -5,
                    y: 0
                )
                .offset(x: mainObservable.isShowMenu ? -50 : 0)
                .padding(.vertical, 60)
            
            // SELECTED VIEW (CURRENTLY VIEW)
            SideMenuTabView(mainObservable: mainObservable, selectedTab: $selectedTab)
            .cornerRadius(mainObservable.isShowMenu ? 15 : 0)
        }
        .scaleEffect(mainObservable.isShowMenu ? 0.8 : 1)
        .offset(x: mainObservable.isShowMenu ? getRect().width - 160 : 0)
        .ignoresSafeArea()
        .overlay(
            // MENU ACTION
            Button(
                action: {
                    withAnimation(.spring()) {
                        //mainObservable.toogleShowMenuNavBar()
                        mainObservable.isShowMenu.toggle()
                        mainObservable.toogleShowMenu()
                    }
                },
                label: {
                    Text("Menu")
                }
            )
            .padding(),
            alignment: .topLeading
        )
    }
}

// MARK: - PREVIEW
//struct SideMenuControlView: PreviewProvider {
//    static var previews: some View {
//        TwoBackgroundCardsView(mainObservable: MainObservable())
//    }
//}
