import SwiftUI

struct FrameworkTitleView: View {
    let framework: Framework
    
    var body: some View {
        VStack(spacing: 14) {
            Image(framework.imageName)
                .resizable()
                .frame(width: 90, height: 90)
            
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
                .foregroundColor(Color(.label))
        }
        .padding()
    }
}

#Preview {
    FrameworkTitleView(framework: MockData.frameworks[0])
        .preferredColorScheme(.dark)
}
