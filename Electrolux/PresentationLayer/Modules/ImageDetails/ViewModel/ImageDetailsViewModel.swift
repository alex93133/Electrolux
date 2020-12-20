import Foundation

protocol ImageDetailsViewModelProtocol {
    
}

class ImageDetailsViewModel: ImageDetailsViewModelProtocol {

    // MARK: - Dependencies
    private var model: ImageDetailsModelProtocol

    init(model: ImageDetailsModelProtocol) {
        self.model = model
    }
}
