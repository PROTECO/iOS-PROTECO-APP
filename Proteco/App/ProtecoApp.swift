// Dependencies
import SwiftUI

@main
struct ProtecoApp: App {
    // MARK: - PROPERTIES
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    // MARK: - BODY
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView()
            } else {
                MainView()
            }
        } //: WINDOW GROUP
    } //: BODY
}
