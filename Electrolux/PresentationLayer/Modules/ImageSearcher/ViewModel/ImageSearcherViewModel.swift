import Foundation

protocol ImageSearcherViewModelProtocol {

}

class ImageSearcherViewModel: ImageSearcherViewModelProtocol {

    // MARK: - Dependencies
    private var model: ImageSearcherModelProtocol
    private var presentationAssembly: PresentationAssemblyProtocol

    init(model: ImageSearcherModelProtocol, presentationAssembly: PresentationAssemblyProtocol) {
        self.model = model
        self.presentationAssembly = presentationAssembly
    }
}
