import SwiftUI

struct BarcodeScannerView: View {
    
    @StateObject var viewModel = BarcodeScannerViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                ScannerView(scannedCode: $viewModel.scannedValue,
                            alertItem: $viewModel.alertItem,
                            isShowingAlert: $viewModel.isShowingAlert)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer()
                    .frame(height: 60)
                
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                Text(viewModel.statusText)
                    .bold()
                    .font(.largeTitle)
                    .foregroundStyle(viewModel.statusTextColor)
                    .padding()
            }
            .navigationTitle("Barcode Scanner")
            .alert(viewModel.alertItem?.title ?? "", isPresented: $viewModel.isShowingAlert) {
                Button("Ok") {
                    viewModel.isShowingAlert = false
                }
            } message: {
                Text(viewModel.alertItem?.message ?? "")
            }
        }
    }
}

#Preview {
    BarcodeScannerView()
}
