import SwiftUI

struct BgGradientView: View {
    var isNight: Bool
    
    var body: some View {
        LinearGradient(
            colors: isNight ? [.black, .gray] : [.blue, Color("lightBlue")],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
}
