import Foundation

protocol ServiceAssemblyProtocol {
    var userDataService: UserDataServiceProtocol { get }
    var flickrService: ImageLoaderServiceProtocol { get }
}

class ServiceAssembly: ServiceAssemblyProtocol {
    lazy var userDataService: UserDataServiceProtocol = UserDataService()
    lazy var flickrService: ImageLoaderServiceProtocol = FlickrService()
}
