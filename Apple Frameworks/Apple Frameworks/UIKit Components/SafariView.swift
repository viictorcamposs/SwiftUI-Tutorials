import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    typealias SafariViewContext = UIViewControllerRepresentableContext<SafariView>
    
    let url: URL
    
    func makeUIViewController(context: SafariViewContext) -> SFSafariViewController {
        SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: SafariViewContext) {}
    
}
