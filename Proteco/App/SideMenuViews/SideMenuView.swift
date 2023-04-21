// Dependencies
import SwiftUI

struct SideMenuView: View {
    // MARK: - PROPERTIES
    @Binding        var selectedTab : String
    @Namespace      var animation
    
    @State var nameProfile  : String = "Athenas Marlene García"
    @State var typeUser     : String = "Becario"
    @State var imageProfile : String = "avatar_17"
    
    let titleProfileBtn     : String = "Ver perfil"
    let appVersion          : String = "1.1.1"
    
    // MARK: - INIT
    init(selectedTab: Binding<String>) {
        self._selectedTab = selectedTab
        UITabBar.appearance().isHidden = true
    }
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            // BACKGROUND COLOR
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
                } //: VSTACK
                .frame(maxWidth: 250, alignment: .leading)

                // TAB BUTTONS
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(menuItems.indices) { index in
                        let option = menuItems[index]

                        if option.selected != "Logout" {
                            TabButton(
                                selected: option.selected,
                                image: option.icon,
                                title: option.text,
                                animation: animation,
                                selectedTab: $selectedTab
                            )
                        }
                    }

                    Spacer()
                    
                    // LINE OF SEPARATOR BETWEEN SECTIONS
                    Divider()

                    // LOGOUT BUTTON
                    TabButton(
                        selected: menuItems[menuItems.count - 1].selected,
                        image: menuItems[menuItems.count - 1].icon,
                        title: menuItems[menuItems.count - 1].text,
                        animation: animation,
                        selectedTab: .constant("")
                    )
                } //: VSTACK
                .padding(.leading, -15)
                .padding(.top, 50)

                // LABEL APP VERSION
                Text("App version:  \(appVersion)")
                    .font(.custom("MontserratAlternates-Medium", size: 14))
                    .foregroundColor(Color("color_light_1"))
            } //: VSTACK
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        } //: ZSTACK
        
    }
}

// MARK: - PREVIEW
struct SideMenuView_Previews: PreviewProvider {
    @State static private var option: String = "Home"
    
    static var previews: some View {
        SideMenuView(selectedTab: $option)
    }
}
