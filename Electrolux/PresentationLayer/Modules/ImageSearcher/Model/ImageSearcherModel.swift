import Foundation

protocol ImageSearcherModelProtocol {
    var flickrService: ImageLoaderServiceProtocol { get }
}

class ImageSearcherModel: ImageSearcherModelProtocol {
    var flickrService: ImageLoaderServiceProtocol

    init(flickrService: ImageLoaderServiceProtocol) {
        self.flickrService = flickrService
    }
}
