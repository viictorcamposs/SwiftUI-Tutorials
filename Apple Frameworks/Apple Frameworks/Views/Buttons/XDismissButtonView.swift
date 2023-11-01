import SwiftUI

struct XDismissButtonView: View {
    @Binding var isDismissButtonClicked: Bool
    
    var body: some View {
        HStack {
            Spacer()

            Button {
                isDismissButtonClicked.toggle()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(Color(.label))
                    .imageScale(.large)
                    .frame(width: 44, height: 44)
                    .clipShape(.rect(cornerRadius: 20))
            }
        }
        .padding()
    }
}

#Preview {
    XDismissButtonView(isDismissButtonClicked: .constant(false))
}
