import SwiftUI

enum NavigationTab {
    case grid
    case list
}

struct MainView: View {
    @State private var selectedTab: NavigationTab = .grid
    
    var body: some View {
        TabView(selection: $selectedTab) {
            FrameworkGridView()
                .tabItem {
                    Label("Grid", systemImage: "star")
                }
                .tag(NavigationTab.grid)
            
            FrameworkListView()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(NavigationTab.list)
        }
        .accentColor(.white)
    }
}

#Preview {
    MainView()
        .preferredColorScheme(.dark)
}
