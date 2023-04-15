// Dependencies
import SwiftUI

struct AdvisoryScheduleView: View {
    // MARK: - PROPERTIES
    @ObservedObject var mainObservable : MainObservable
    
    let titleView: String = "Agendar asesorías"
    
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
        .onAppear {
            mainObservable.toogleShowMenu()
        }
        .onDisappear {
            mainObservable.toogleShowMenu()
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
