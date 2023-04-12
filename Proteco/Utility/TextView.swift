// Dependencies
import SwiftUI

struct TextView: UIViewRepresentable {
    // MARK: - PROPERTIES
    var text: String
    
    // MARK: - FUNCTIONS
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        
        textView.textAlignment = .justified
        textView.isEditable = false
        textView.dataDetectorTypes = .all
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
        uiView.font = UIFont(name: "MontserratAlternates-Regular", size: 10)
        uiView.textColor = UIColor(Color("color_dark"))
        uiView.backgroundColor = UIColor.clear
    }
}
