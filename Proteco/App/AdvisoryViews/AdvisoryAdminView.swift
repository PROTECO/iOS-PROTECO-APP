// Dependencies
import SwiftUI

struct AdvisoryAdminView: View {
    // MARK: - PROPERTIES
    @ObservedObject var mainObservable : MainObservable
    @State          var performActionOnBackGesture = false
    @Environment(\.dismiss) var dismiss
    
    let titleView   : String = "Administración de asesorías"
    let titleButton : String = "Asesorias"
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Text("Administrar asesorías")
        } //: VSTACK
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("color_bg_gray"))
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

// MARK: - PREVIEW
struct AdvisoryAdminView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AdvisoryAdminView(mainObservable: MainObservable())
        }
    }
}
