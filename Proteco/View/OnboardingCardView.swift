// Dependencies
import SwiftUI

struct OnboardingCardView: View {
    // MARK: - PROPERTIES
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    @State private var isAnimating: Bool = false
    
    let title       : String = "¡Bien hecho!"
    let subtitle    : String = "Te damos la bienvenida a tu aplicación"
    let headline    : String = "Con tu cuenta podrás:"
    var onboarding  : Onboarding
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                TitlesView(
                    title: self.title,
                    description: self.subtitle,
                    fgColorTitle: Color("color_dark")
                )
                
                Spacer()
                    .frame(width: 10, height: 60)
                
                // ONBOARDING: IMAGE
                Image(onboarding.image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 300)
                    .scaleEffect(isAnimating ? 1.0 : 0.6)
                
                // ONBOARDING: TITLE
                VStack(spacing: 5) {
                    Text(self.headline)
                        .font(.custom("MontserratAlternates-Bold" , size: 20))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("color_dark"))
                    
                    Text(onboarding.description)
                        .font(.custom("MontserratAlternates-Regular" , size: 14))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("color_dark"))
                }
                .padding(.horizontal, 30)
                
                Spacer()
                    .frame(width: 10, height: 20)
                
                // BUTTON: START
                CustomButtom(
                    action: {
                        isOnboarding = false
                    },
                    title: "Comenzar",
                    style: CustomButtonStyle(
                        style: .unfilledDark,
                        width: 130,
                        height: 40,
                        upper: true,
                        shadow: true
                    )
                )
                
                Spacer()
                    .frame(width: 10, height: 80)
            } //: VSTACK
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .center
            )
        } //: ZSTACK
        .onAppear {
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimating = true
            }
        }
        .background(onboarding.bgColor)
    }
}

// MARK: - PREVIEW
struct OnboardingCardView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingCardView(onboarding: onboardingData[0])
            .previewLayout(.fixed(width: 320, height: 640))
    }
}
