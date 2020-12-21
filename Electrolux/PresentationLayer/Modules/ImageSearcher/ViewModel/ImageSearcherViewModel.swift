import UIKit

protocol ImageSearcherViewModelProtocol {
    var delegate: ImageSearcherViewModelDelegate? { get set }
    func numberOfItemsInSection() -> Int
    func getData(search text: String)
    func setImage(to imageView: UIImageView, indexPath: IndexPath)
    func didSelectItemAt(indexPath: IndexPath)
}

protocol ImageSearcherViewModelDelegate: class {
    func dataDidUpdate()
    func presentImageDetailsViewController(_ imageDetailsViewController: ImageDetailsViewController)
    func presentError(error: Error)
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
    var imageMetaDataList = [ImageMetaData]()
    weak var delegate: ImageSearcherViewModelDelegate?

    func numberOfItemsInSection() -> Int {
        return imageMetaDataList.count
    }

    func getData(search text: String) {
        model.flickrService.sendRequest(tag: text) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let imageMetaDataList):
                    self.imageMetaDataList = imageMetaDataList
                    self.delegate?.dataDidUpdate()

                case .failure(let error):
                    self.delegate?.presentError(error: error)
                }
            }
        }
    }

    func didSelectItemAt(indexPath: IndexPath) {
        let imageMetaData = imageMetaDataList[indexPath.item]
        let imageDetailsViewController = presentationAssembly.imageDetailsViewController(imageMetaData: imageMetaData)
        delegate?.presentImageDetailsViewController(imageDetailsViewController)
    }

    func setImage(to imageView: UIImageView, indexPath: IndexPath) {
        let imageMetaData = imageMetaDataList[indexPath.item]
        guard let url = model.flickrService.generateImageURL(size: .small, metaData: imageMetaData) else { return }
        imageView.kf.setImage(with: url, options: [.transition(.fade(0.2))])
    }
}
