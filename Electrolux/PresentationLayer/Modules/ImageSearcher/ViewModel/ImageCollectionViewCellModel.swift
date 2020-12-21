import Foundation

protocol ImageCollectionViewCellModelProtocol {
    var imageURL: URL { get set }
}

struct ImageCollectionViewCellModel: ImageCollectionViewCellModelProtocol {
    var imageURL: URL
}
