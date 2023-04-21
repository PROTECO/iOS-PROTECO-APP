// Dependencies
import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTIES
    @AppStorage("isOnboarding") var isOnboarding : Bool?
    
    var onboardings : [Onboarding] = onboardingData
    
    // MARK: - BODY
    var body: some View {
        VStack {
            ZStack {
                TabView {
                    ForEach(onboardings[0 ... onboardings.count - 1]) { item in
                        OnboardingCardView(onboarding: item)
                    } //: LOOP
                } //: TAB
            } //: ZSTACK
            .tabViewStyle(PageTabViewStyle())
        } //: VSTACK
        .edgesIgnoringSafeArea(.all)
    }
}

// MARK: - PREVIEW
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
