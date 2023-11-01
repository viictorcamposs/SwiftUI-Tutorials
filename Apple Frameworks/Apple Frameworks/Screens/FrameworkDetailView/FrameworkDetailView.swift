import SwiftUI

struct FrameworkDetailView: View {
    let framework: Framework
    
    let isComingFromGridView: Bool
    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView = false
    
    var body: some View {
        VStack {
            if isComingFromGridView == true {
                XDismissButtonView(isDismissButtonClicked: $isShowingDetailView)
            }
            
            FrameworkTitleView(framework: framework)
            
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            LearnMoreButtonView(isShowingSafariView: $isShowingSafariView)
            
            if isComingFromGridView == false {
                Spacer()
            }
        }
        .sheet(isPresented: $isShowingSafariView) {
            if let url = URL(string: framework.urlString) {
                SafariView(url: url)
            }
        }
    }
}

struct LearnMoreButtonView: View {
    @Binding var isShowingSafariView: Bool
    
    var body: some View {
        if #available(iOS 15.0, *) {
            Button {
                isShowingSafariView.toggle()
            } label: {
                Label("Learn More", systemImage: "book.fill")
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .tint(.red)
        } else {
            Button {
                isShowingSafariView.toggle()
            } label: {
                AFButton(title: "Learn More")
            }
        }
    }
}

#Preview {
    FrameworkDetailView(framework: MockData.frameworks[0],
                        isComingFromGridView: false,
                        isShowingDetailView: .constant(false))
    .preferredColorScheme(.dark)
}
