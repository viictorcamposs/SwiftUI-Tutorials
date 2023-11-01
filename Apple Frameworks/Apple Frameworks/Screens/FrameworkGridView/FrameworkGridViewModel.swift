import SwiftUI

final class FrameworkGridViewModel: ObservableObject {
    
    var selectedFramework: Framework? {
        didSet { isShowingDetail = true }
    }
    
    @Published var isShowingDetail = false
}
