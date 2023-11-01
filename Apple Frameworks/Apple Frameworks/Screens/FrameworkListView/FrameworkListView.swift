import SwiftUI

struct FrameworkListView: View {
    @StateObject var viewModel = FrameworkGridViewModel()
    
    var body: some View {
        NavigationView {
            List(MockData.frameworks) { framework in
                NavigationLink {
                    FrameworkDetailView(framework: framework)
                } label: {
                    FrameworkListRowView(framework: framework)
                }
            }
            .listStyle(.plain)
            .navigationTitle("🍎 Frameworks")
        }
    }
}

#Preview {
    FrameworkListView()
        .preferredColorScheme(.dark)
}
