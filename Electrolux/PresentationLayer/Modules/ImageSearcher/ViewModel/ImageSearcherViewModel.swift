import Foundation

protocol ImageSearcherViewModelProtocol {
    var delegate: ImageSearcherViewModelDelegate? { get set }
    func numberOfItemsInSection() -> Int
    func getCellModel() -> [ImageCollectionViewCellModelProtocol]
    func getData(search text: String)
}

protocol ImageSearcherViewModelDelegate: class {
    func dataDidUpdate()
}

class ImageSearcherViewModel: ImageSearcherViewModelProtocol {

    // MARK: - Dependencies
    var model: ImageSearcherModelProtocol
    var presentationAssembly: PresentationAssemblyProtocol
    init(model: ImageSearcherModelProtocol, presentationAssembly: PresentationAssemblyProtocol) {
        self.model = model
        self.presentationAssembly = presentationAssembly
    }

    // MARK: - Properties
    var imageMetaData = [ImageMetaData]()
    weak var delegate: ImageSearcherViewModelDelegate?

    func numberOfItemsInSection() -> Int {
        return imageMetaData.count
    }

    func getData(search text: String) {
        model.flickrService.sendRequest(tag: text) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let imageMetaDataList):
                    self.imageMetaData = imageMetaDataList
                    self.delegate?.dataDidUpdate()

                case .failure(_):
                    return
                }
            }
        }
    }

    func getCellModel() -> [ImageCollectionViewCellModelProtocol] {
        let imageURLs = imageMetaData.compactMap { model.flickrService.generateImageURL(size: .small, metaData: $0) }
        let cellModel = imageURLs.map { ImageCollectionViewCellModel(imageURL: $0) }
        return cellModel
    }
}
