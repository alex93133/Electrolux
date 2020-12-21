import UIKit

class UserInfoViewController: UIViewController {

    // MARK: - Properties
    lazy var userInfoView: UserInfoView = {
        let view = UserInfoView(frame: UIScreen.main.bounds)
        return view
    }()

    // MARK: - Dependencies
    var viewModel: UserInfoViewModelProtocol
    init(viewModel: UserInfoViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - VC Lifecycle
    override func loadView() {
        view = userInfoView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: - Functions
    private func setupView() {
        userInfoView.setupUIElements()
        userInfoView.nameLabel.text = viewModel.nameLabelText
        userInfoView.photoImageView.image = viewModel.photo
        userInfoView.descriptionLabel.text = viewModel.descriptionLabelText
        userInfoView.descriptionLabel.addLineSpacing()
    }
}
