// Dependencies
import SwiftUI

struct TabButton: View {
    // MARK: - PROPERTIES
    var selected    : String
    var image       : String
    var title       : String
    var animation   : Namespace.ID
    
    @Binding    var selectedTab: String
    
    var fillImage   : String {
        image + ".fill"
    }
    
    // MARK: - BODY
    var body: some View {
        Button(
            action: {
                withAnimation(.spring()) {
                    selectedTab = selected
                }
            },
            label: {
                HStack(spacing: 15) {
                    Image(systemName: selectedTab == selected ? fillImage : image)
                        .font(.title2)
                    
                    Text(title)
                        .font(selectedTab == selected ? .custom("MontserratAlternates-SemiBold", size: 16) : .custom("MontserratAlternates-Regular", size: 16))
                } //: HSTACK
                .frame(width: 200, alignment: .leading)
                .foregroundColor(selectedTab == selected ? Color("color_dark_1") : Color("color_light_1"))
                .padding(.vertical, 12)
                .padding(.horizontal, 20)
                .frame(
                    maxWidth: getRect().width - 170,
                    alignment: .leading
                )
                .background(
                    Color("color_secondary")
                        .opacity(selectedTab == selected ? 1 : 0)
                        .clipShape(CustomCorner(
                            corners: [.topRight, .bottomRight],
                            radius: 12)
                        )
                )
            }
        ) //: BUTTON
    }
}

struct TabButton_Previews: PreviewProvider {
    @State static private var option    : String = "Home"
    @State static private var menuItem  = menuItems[0]
    @Namespace static private var animation
    
    static var previews: some View {
        TabButton(
            selected: menuItem.selected,
            image: menuItem.icon,
            title: menuItem.text,
            animation: animation,
            selectedTab: $option
        )
        .previewLayout(.sizeThatFits)
        .padding()
        .background(Color.pink)
    }
}
