import SwiftUI

struct AlertItem {
    let title: String
    let message: String
}

struct AlertContext {
    static let invalidDeviceInput = AlertItem(title: "Invalid device input",
                                              message: "Something went wrong with the camera. Unable to capture the input.")
    static let invalidScannedValue = AlertItem(title: "Invalid scanned type",
                                               message: "Invalid scanned value. This app scans EAN-8 and EAN-13.")
}

struct BarcodeScannerView: View {
    
    @State private var scannedValue = String()
    @State private var isShowingAlert = false
    @State private var alertItem: AlertItem? 
    
    var body: some View {
        NavigationStack {
            VStack {
                ScannerView(scannedCode: $scannedValue, 
                            alertItem: $alertItem, 
                            isShowingAlert: $isShowingAlert)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer()
                    .frame(height: 60)
                
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                Text(scannedValue.isEmpty ? "Not yet scanned" : scannedValue)
                    .bold()
                    .font(.largeTitle)
                    .foregroundStyle(scannedValue.isEmpty ? .red : .green)
                    .padding()
            }
            .navigationTitle("Barcode Scanner")
            .alert(alertItem?.title ?? "", isPresented: $isShowingAlert) {
                Button("Ok") {
                    isShowingAlert = false
                }
            } message: {
                Text(alertItem?.message ?? "")
            }
        }
    }
}

#Preview {
    BarcodeScannerView()
}
