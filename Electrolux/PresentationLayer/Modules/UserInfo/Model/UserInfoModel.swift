import Foundation

protocol UserInfoModelProtocol {
    var userDataService: UserDataServiceProtocol { get }
}

class UserInfoModel: UserInfoModelProtocol {
    var userDataService: UserDataServiceProtocol

    init(userDataService: UserDataServiceProtocol) {
        self.userDataService = userDataService
    }
}
