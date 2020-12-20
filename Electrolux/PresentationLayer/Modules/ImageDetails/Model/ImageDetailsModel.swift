import Foundation

protocol ImageDetailsModelProtocol {
    var flickrService: ImageLoaderServiceProtocol { get }
}

class ImageDetailsModel: ImageDetailsModelProtocol {
    var flickrService: ImageLoaderServiceProtocol

    init(flickrService: ImageLoaderServiceProtocol) {
        self.flickrService = flickrService
    }
}
