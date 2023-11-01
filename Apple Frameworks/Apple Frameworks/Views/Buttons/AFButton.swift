import SwiftUI

struct AFButton: View {
    let title: String
    
    var body: some View {
        Text(title)
            .bold()
            .frame(width: 280, height: 50)
            .background(Color.red)
            .clipShape(.rect(cornerRadius: 10))
            .foregroundColor(.white)
    }
}
