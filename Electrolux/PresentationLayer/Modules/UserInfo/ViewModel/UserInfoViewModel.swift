import Foundation

protocol UserInfoViewModelProtocol {

}

class UserInfoViewModel: UserInfoViewModelProtocol {

    // MARK: - Dependencies
    var model: UserInfoModelProtocol

    init(model: UserInfoModelProtocol) {
        self.model = model
    }
}
