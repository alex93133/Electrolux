import Foundation

protocol PresentationAssemblyProtocol {
    func tabBarController() -> TabBarController
    func imageSearcherViewController() -> ImageSearcherViewController
    func imageDetailsViewController(imageMetaData: ImageMetaData) -> ImageDetailsViewController
    func userInfoViewController() -> UserInfoViewController
}

class PresentationAssembly: PresentationAssemblyProtocol {

    private var serviceAssembly: ServiceAssemblyProtocol

    init(serviceAssembly: ServiceAssemblyProtocol) {
        self.serviceAssembly = serviceAssembly
    }

    // MARK: - TabBarController
    func tabBarController() -> TabBarController {
        let tabBarController = TabBarController(presentationAssembly: self)
        return tabBarController
    }

    // MARK: - ImageSearcherViewController
    func imageSearcherViewController() -> ImageSearcherViewController {
        let imageSearcherModel: ImageSearcherModelProtocol = ImageSearcherModel(flickrService: serviceAssembly.flickrService)
        let imageSearcherViewModel: ImageSearcherViewModelProtocol = ImageSearcherViewModel(model: imageSearcherModel, presentationAssembly: self)
        let imageSearcherViewController = ImageSearcherViewController(viewModel: imageSearcherViewModel)
        return imageSearcherViewController
    }

    // MARK: - ImageDetailsViewController
    func imageDetailsViewController(imageMetaData: ImageMetaData) -> ImageDetailsViewController {
        let imageDetailsModel: ImageDetailsModelProtocol = ImageDetailsModel(flickrService: serviceAssembly.flickrService)
        let imageDetailsViewModel: ImageDetailsViewModelProtocol = ImageDetailsViewModel(model: imageDetailsModel, imageMetaData: imageMetaData)
        let imageDetailsViewController = ImageDetailsViewController(viewModel: imageDetailsViewModel)
        return imageDetailsViewController
    }

    // MARK: - UserInfoViewController
    func userInfoViewController() -> UserInfoViewController {
        let userInfoModel: UserInfoModelProtocol = UserInfoModel(userDataService: serviceAssembly.userDataService)
        let userInfoViewModel: UserInfoViewModelProtocol = UserInfoViewModel(model: userInfoModel)
        let userInfoViewController = UserInfoViewController(viewModel: userInfoViewModel)
        return userInfoViewController
    }
}
