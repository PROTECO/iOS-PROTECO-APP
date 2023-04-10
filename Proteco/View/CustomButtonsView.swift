// Dependencies
import SwiftUI
import SwiftUIFontIcon

// MARK: - TEXT UPPERCASE
struct UppercaseButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .textCase(.uppercase)
    }
} //: TEXT UPPERCASE

// MARK: - BUTTON STYLE
struct CustomButtonStyle: ButtonStyle {
    // MARK: - PROPERTIES
    var style       : TypesButtonStyle
    var width       : CGFloat?
    var height      : CGFloat?
    var size        : CGFloat?
    var upper       : Bool?
    var shadow      : Bool?
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(
                maxWidth: width != nil ? width : .infinity,
                maxHeight: height != nil ? height : 70.0
            )
            .font(.custom("Assistant-Medium" , size: size != nil ? size! : 20))
            .textCase(upper != nil ? (upper! ? .uppercase : .lowercase) : .none)
            .background(style.model.backgroundColor)
            .foregroundColor(style.model.foregroundColor)
            .buttonStyle(.plain)
            .cornerRadius(20)
            .modifier(shadow != nil ? ShadowView(isShadow: true) : ShadowView())
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
    }
} //: BUTTON STYLE

// MARK: - CUSTOM BUTTON
struct CustomButtom: View {
    // MARK: - PROPERTIES
    var action          : (() -> Void)?
    var title           : String
    var icon            : String?
    var link            : String?
    var style           : CustomButtonStyle
    var isNotEnabled    : Bool?
    
    @Environment(\.openURL) private var openURL
    
    // MARK: - BODY
    var body: some View {
        Button(action: {
            if action == nil {
                if link != nil {
                    if (link! == "settings") {
                        openURL(URL(string: UIApplication.openSettingsURLString)!)
                    }
                    else {
                        openURL(URL(string: link!)!)
                    }
                }
            }
            else {
                action!()
            }
        }) {
            HStack {
                if icon != nil {
                    FontIcon.text(.ionicon(code: IonIconsCode(rawValue: icon!) ?? .ios_alert), fontsize: 24)
                }
                Text(title)
            } //: HSTACK
        } //: BUTTON
        .buttonStyle(style)
        .disabled(isNotEnabled != nil && isNotEnabled! ? true : false)
    }
} //: CUSTOM BUTTON

struct CustomButtonsView: View {
    // MARK: - PROPERTIES VIEW
    private var bg_view : String?
    
    // MARK: - BODY VIEW
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                CustomButtom(
                    title: "Main Button",
                    style: CustomButtonStyle(
                        style: .main,
                        upper: true,
                        shadow: true
                    )
                )
                
                CustomButtom(
                    title: "Secondary button",
                    style: CustomButtonStyle(
                        style: .secondary,
                        upper: true,
                        shadow: true
                    )
                )
                
                CustomButtom(
                    title: "Tertiary button",
                    style: CustomButtonStyle(
                        style: .tertiary,
                        upper: true,
                        shadow: true
                    )
                )
                
                CustomButtom(
                    title: "Transparent button",
                    style: CustomButtonStyle(
                        style: .transparent,
                        upper: true,
                        shadow: true
                    )
                )
                
                CustomButtom(
                    title: "Unifilled button",
                    style: CustomButtonStyle(
                        style: .unfilled,
                        upper: true,
                        shadow: true
                    )
                )
                
                HStack(spacing: 15) {
                    CustomButtom(
                        title: "1",
                        style: CustomButtonStyle(
                            style: .transparent,
                            upper: true,
                            shadow: true
                        )
                    )
                    
                    CustomButtom(
                        title: "2",
                        style: CustomButtonStyle(
                            style: .transparent,
                            upper: true,
                            shadow: true
                        )
                    )
                    
                    CustomButtom(
                        title: "3",
                        icon: "\u{f4a7}",
                        link: "settings",
                        style: CustomButtonStyle(
                            style: .transparent,
                            upper: true,
                            shadow: true
                        )
                    )
                } //: HSTACK
                
                HStack(spacing: 20) {
                    CustomButtom(
                        title: "Github",
                        icon: "\u{f239}",
                        link: "https://github.com/reusHarper/",
                        style: CustomButtonStyle(
                            style: .dark,
                            width: 140,
                            height: 40,
                            size: 20
                        )
                    )
                    
                    CustomButtom(
                        title: "Label",
                        style: CustomButtonStyle(
                            style: .mainV2,
                            width: 140,
                            height: 40,
                            size: 20
                        ),
                        isNotEnabled: true
                    )
                }
            } //: VSTACK
            .padding(.horizontal, 20)
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .center
        )
        
    }
}

// MARK: - PREVIEW
struct CustomButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonsView()
            .previewLayout(.sizeThatFits)
    }
}
