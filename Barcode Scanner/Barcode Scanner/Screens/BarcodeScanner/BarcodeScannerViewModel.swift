import SwiftUI

final class BarcodeScannerViewModel: ObservableObject {
    @Published var scannedValue = String()
    @Published var isShowingAlert = false
    @Published var alertItem: AlertItem?
    
    var statusText: String {
        scannedValue.isEmpty ? "Not yet scanned" : scannedValue
    }
    
    var statusTextColor: Color {
        scannedValue.isEmpty ? .red : .green
    }
}
