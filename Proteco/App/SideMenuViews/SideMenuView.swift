// Dependencies
import SwiftUI

struct SideMenuView: View {
    // MARK: - PROPERTIES
    //@Binding var selectedTab : String
    
    @Namespace var animation
    
    @State var nameProfile  : String = "Athenas Marlene García"
    @State var typeUser     : String = "Becario"
    @State var imageProfile : String = "avatar_17"
    @State var selectedTab  : TabModel  = .home
    
    let titleProfileBtn     : String = "Ver perfil"
    
    // MARK: - BODY
    var body: some View {
        // VIEWS
        let tabViews = Group {
            switch selectedTab {
            case .advices:
                Text("Convocatoria")
            case .courses:
                Text("Contacto")
            case .home:
                Text("Feedback")
            case .workshops:
                Text("Sitio Web")
            case .account:
                Text("Créditos")
            } //: GROUP
        } //: VIEWS
        
        
        ZStack {
            Color("AccentColor")
                .ignoresSafeArea()
            
            // SIDE MENU
            VStack(alignment: .leading, spacing: 15) {
                // PROFILE IMAGE
                Image(imageProfile)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 70)
                    .cornerRadius(10)
                    .padding(.top, 50)
                
                // PROFILE DATA
                VStack(alignment: .leading, spacing: 6) {
                    // NAME
                    Text(nameProfile)
                        .font(.custom("MontserratAlternates-Bold", size: 22))
                        .foregroundColor(Color("color_light_1"))
                    
                    // TYPE USER
                    Text(typeUser)
                        .font(.custom("MontserratAlternates-SemiBold", size: 16))
                        .fontWeight(.regular)
                        .foregroundColor(Color("color_light_1"))
                    
                    // PROFILE BUTTON
                    CustomButtom(
                        title: titleProfileBtn,
                        icon: "\u{f345}",
                        style: CustomButtonStyle(
                            style: .main,
                            width: 120,
                            height: 30,
                            size: 20,
                            upper: false
                        )
                    )
                } //: VSTACK
                .frame(maxWidth: 250, alignment: .leading)
                
                // TAB BUTTONS
                VStack(spacing: 0) {
                    TabButton(
                        image: "square.and.pencil.circle.fill",
                        title: "Convocatoria",
                        animation: Namespace.ID,
                        selectedTab: <#T##String#>
                    )
                }
                
            } //: VSTACK
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            
        } //: ZSTACK
    }
}

// MARK: - PREVIEW
struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
