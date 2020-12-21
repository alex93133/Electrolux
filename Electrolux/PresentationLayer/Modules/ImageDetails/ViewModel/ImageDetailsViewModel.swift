import UIKit

protocol ImageDetailsViewModelProtocol {
    var navBarTitle: String { get }
    func setImage(to imageView: UIImageView)
}

class ImageDetailsViewModel: ImageDetailsViewModelProtocol {

    // MARK: - Dependencies
    private var model: ImageDetailsModelProtocol
    private var imageMetaData: ImageMetaData

    init(model: ImageDetailsModelProtocol, imageMetaData: ImageMetaData) {
        self.model = model
        self.imageMetaData = imageMetaData
    }

    // MARK: - Properties
    var navBarTitle: String {
        return imageMetaData.title
    }

    // MARK: - Functions
    func setImage(to imageView: UIImageView) {
        guard let url = model.flickrService.generateImageURL(size: .large, metaData: imageMetaData) else { return }
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: url, options: [.transition(.fade(0.2))])
    }
}
