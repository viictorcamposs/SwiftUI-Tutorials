import SwiftUI

struct BarcodeScannerView: View {
    
    @State private var scannedValue = String()
    
    var body: some View {
        NavigationStack {
            VStack {
                ScannerView(scannedCode: $scannedValue)
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
        }
    }
}

#Preview {
    BarcodeScannerView()
}
