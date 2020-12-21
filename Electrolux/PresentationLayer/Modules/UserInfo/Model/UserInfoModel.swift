import Foundation

protocol UserInfoModelProtocol {
    var userDataService: UserDataServiceProtocol { get }
}

struct UserInfoModel: UserInfoModelProtocol {
    var userDataService: UserDataServiceProtocol
}
