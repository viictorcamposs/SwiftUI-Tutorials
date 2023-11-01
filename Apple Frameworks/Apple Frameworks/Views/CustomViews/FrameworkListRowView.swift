import SwiftUI

struct FrameworkListRowView: View {
    let framework: Framework
    
    var body: some View {
        HStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 50, height: 50)
            
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
                .foregroundColor(Color(.label))
                .padding()
            
            Spacer()
        }
    }
}

#Preview {
    FrameworkListRowView(framework: MockData.frameworks[0])
}
