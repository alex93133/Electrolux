import UIKit

protocol UserInfoViewModelProtocol {
    var nameLabelText: String { get }
    var descriptionLabelText: String { get }
    var photo: UIImage { get }
}

class UserInfoViewModel: UserInfoViewModelProtocol {

    // MARK: - Dependencies
    var model: UserInfoModelProtocol

    init(model: UserInfoModelProtocol) {
        self.model = model
    }

    // MARK: - Properties
    var nameLabelText: String {
        var nameLabelText = model.userDataService.getUser().firstName
        if let lastName = model.userDataService.getUser().lastName {
            nameLabelText.append(" \(lastName)")
        }
        return nameLabelText
    }

    var descriptionLabelText: String {
        model.userDataService.getUser().description
    }

    var photo: UIImage {
        model.userDataService.getUser().photo
    }
}
