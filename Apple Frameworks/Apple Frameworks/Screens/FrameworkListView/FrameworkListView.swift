import SwiftUI

struct FrameworkListView: View {
    @StateObject var viewModel = FrameworkGridViewModel()
    
    var body: some View {
        NavigationView {
            List(MockData.frameworks) { framework in
                NavigationLink {
                    FrameworkDetailView(framework: framework,
                                        isComingFromGridView: false,
                                        isShowingDetailView: $viewModel.isShowingDetail)
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
}
