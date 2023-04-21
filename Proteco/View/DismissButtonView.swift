// Dependencies
import SwiftUI

struct DismissButtonView: View {
    // MARK: - PROPERTIES
    @Environment(\.dismiss) var dismiss
    
    var title   : String
    var action  : (() -> Void)?
    
    // MARK: - BODY
    var body: some View {
        Button(
            action: {
                dismiss()
                if action != nil {
                    action!()
                }
            }
        ) {
            HStack {
                Image(systemName: "chevron.backward")
                Text(title)
            }
        }
    }
}

// MARK: - PREVIEW
struct DismissButtonView_Previews: PreviewProvider {
    static var previews: some View {
        DismissButtonView(title: "Dismiss")
    }
}
