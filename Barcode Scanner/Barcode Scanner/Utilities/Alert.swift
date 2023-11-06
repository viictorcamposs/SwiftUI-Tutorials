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
