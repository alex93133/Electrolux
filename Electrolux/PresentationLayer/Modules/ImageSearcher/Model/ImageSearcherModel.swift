import Foundation

protocol ImageSearcherModelProtocol {
    var flickrService: ImageLoaderServiceProtocol { get }
}

struct ImageSearcherModel: ImageSearcherModelProtocol {
    var flickrService: ImageLoaderServiceProtocol
}
