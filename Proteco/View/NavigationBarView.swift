// Dependencies
import SwiftUI
import SwiftUIFontIcon

struct NavigationBarView: View {
    // MARK: - PROPERTIES
    @ObservedObject var mainObservable : MainObservable
    
    @State var coursesTotal : Int = 10
    @State var alertsTotal  : Int = 10
    
    // MARK: - BODY
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            // MENU
            Button(
                action: {  },
                label: {
                    ZStack {
                        Rectangle()
                            .fill(Color("color_dark_1"))
                            .frame(width: 20, height: 2.5, alignment: .center)
                            .cornerRadius(5)
                            .offset(x: 0, y: -8)

                        Rectangle()
                            .fill(Color("color_dark_1"))
                            .frame(width: 12, height: 2.5, alignment: .center)
                            .cornerRadius(5)
                            .offset(x: -4, y: 0)

                        Rectangle()
                            .fill(Color("color_dark_1"))
                            .frame(width: 20, height: 2.5, alignment: .center)
                            .cornerRadius(5)
                            .offset(x: 0, y: 8)
                    } //: ZSTACK
                    .frame(width: 25, height: 25, alignment: .center)
                }
            ) //: BUTTON

            Spacer()

            HStack(spacing: 10) {
                // CART
                Button(
                    action: {  },
                    label: {
                        ZStack {
                            Image(systemName: "cart.fill")
                                .font(.title)
                            .foregroundColor(Color("color_dark_1"))

                            ZStack {
                                Circle()
                                    .fill(Color("AccentColor"))

                                Text(coursesTotal <= 9 ? "\(coursesTotal)" : "+9")
                                    .foregroundColor(Color("color_light_1"))
                                    .font(.custom("MontserratAlternates-Bold", size: 7))
                            } //: ZSTACK
                            .frame(width: 14, height: 14, alignment: .center)
                            .offset(x: 13, y: -10)
                        } //: ZSTACK
                    }
                )
                
                // NOTIFICATION
                Button(
                    action: {  },
                    label: {
                        ZStack {
                            Image(systemName: "bell.fill")
                                .font(.title)
                            .foregroundColor(Color("color_dark_1"))

                            ZStack {
                                Circle()
                                    .fill(Color("AccentColor"))

                                Text(alertsTotal <= 9 ? "\(alertsTotal)" : "+9")
                                    .foregroundColor(Color("color_light_1"))
                                    .font(.custom("MontserratAlternates-Bold", size: 7))
                            } //: ZSTACK
                            .frame(width: 14, height: 14, alignment: .center)
                            .offset(x: 10, y: -10)
                        } //: ZSTACK
                    }
                ) //: BUTTON
            } //: HSTACK
        } //: HSTACK
        .padding(.horizontal, 20)
        .background(Color.clear)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0.0, y: 5.0)
    }
}

// MARK: - PREVIEW
struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView(mainObservable: MainObservable())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
