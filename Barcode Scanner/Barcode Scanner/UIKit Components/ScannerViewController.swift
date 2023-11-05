import UIKit
import AVFoundation

protocol ScannerViewControllerDelegate: AnyObject {
    func didFindBarcode(barcode: String)
}

final class ScannerViewController: UIViewController {
    
    let captureSession = AVCaptureSession()
    var previewLayer: AVCaptureVideoPreviewLayer?
    weak var scannerDelegate: ScannerViewControllerDelegate?
    
    init(delegate: ScannerViewControllerDelegate) {
        super.init(nibName: nil, bundle: nil)
        
        self.scannerDelegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCaptureSession() {
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else {
            return // error handling
        }
        
        let videoInput: AVCaptureDeviceInput
        
        do {
            try videoInput = AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return // error handling
        }
        
        if captureSession.canAddInput(videoInput) {
            captureSession.addInput(videoInput)
        } else {
            return // error handling
        }
        
        let metaDataOutput = AVCaptureMetadataOutput()
        
        if captureSession.canAddOutput(metaDataOutput) {
            captureSession.addOutput(metaDataOutput)
            
            metaDataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metaDataOutput.metadataObjectTypes = [.ean8, .ean13]
        } else {
            return // error handling
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer!.videoGravity = .resizeAspectFill
        
        view.layer.addSublayer(previewLayer!)
        
        captureSession.startRunning()
    }
}

// MARK: - AVCaptureMetadataOutputObjectsDelegate

extension ScannerViewController: AVCaptureMetadataOutputObjectsDelegate {
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        guard let object = metadataObjects.first else {
            return // error handling
        }
        
        guard let machineReadableObject = object as? AVMetadataMachineReadableCodeObject else {
            return // error handling
        }
        
        guard let barcode = machineReadableObject.stringValue else {
            return // error handling
        }
        
        scannerDelegate?.didFindBarcode(barcode: barcode)
    }
    
}
