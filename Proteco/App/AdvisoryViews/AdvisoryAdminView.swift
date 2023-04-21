// Dependencies
import SwiftUI

struct AdvisoryAdminView: View {
    // MARK: - PROPERTIES
    @ObservedObject var mainObservable : MainObservable
    
    @State private var isShowing = false
    
    let titleView: String = "Administración de asesorías"
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Button(action: {
                self.isShowing.toggle()
            }) {
                Text("Mostrar/ocultar vista")
            }
            if isShowing {
                Text("¡Hola, mundo!")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .frame(width: 200, height: 200)
                    .background(Color.blue)
                    .cornerRadius(20)
                    .opacity(isShowing ? 1 : 0)
                    .animation(.easeInOut(duration: 0.5))
                    .onAppear {
                        withAnimation(.easeInOut(duration: 5)) {
                            self.isShowing = true
                        }
                    }
                    .onDisappear {
                        self.isShowing = false
                    }
            }
        } //: VSTACK
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("color_bg_gray"))
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

// MARK: - PREVIEW
struct AdvisoryAdminView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AdvisoryAdminView(mainObservable: MainObservable())
        }
    }
}
