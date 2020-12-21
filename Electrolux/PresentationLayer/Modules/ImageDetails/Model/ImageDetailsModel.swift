import Foundation

protocol ImageDetailsModelProtocol {
    var flickrService: ImageLoaderServiceProtocol { get }
}

struct ImageDetailsModel: ImageDetailsModelProtocol {
    var flickrService: ImageLoaderServiceProtocol
}
