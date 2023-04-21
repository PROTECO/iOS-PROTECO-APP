// Dependencies
import SwiftUI

struct AdvisoryScheduleView: View {
    // MARK: - PROPERTIES
    @ObservedObject var mainObservable : MainObservable
    @State          var performActionOnBackGesture = false
    @Environment(\.dismiss) var dismiss
    
    let titleView   : String = "Agendar asesorías"
    let titleButton : String = "Asesorias"
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Text("Advisory Schedule")
        } //: VSTACK
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("color_bg_meat"))
        .navigationBarTitle(
            titleView,
            displayMode: .inline
        )
        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
            .onEnded({ _ in })
        )
        .onAppear {
            if mainObservable.isShowTabBar && !mainObservable.isShowSideMenu {
                mainObservable.isShowTabBar.toggle()
            }
            mainObservable.isShowBtnSideMenu.toggle()
        }
        .onDisappear {
            if !mainObservable.isShowTabBar && !mainObservable.isShowSideMenu {
                mainObservable.isShowTabBar.toggle()
            }
            mainObservable.isShowBtnSideMenu.toggle()
        }
    }
    
    // MARK: - FUNCTIONS
    func dismissView() {
        UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true, completion: nil)
    }
}

struct AdvisoryScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AdvisoryScheduleView(mainObservable: MainObservable())
        }
    }
}
