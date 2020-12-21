import UIKit

class ImageDetailsViewController: UIViewController {

    // MARK: - Properties
    private lazy var imageDetailsView: ImageDetailsView = {
        let view = ImageDetailsView(frame: UIScreen.main.bounds)
        return view
    }()

    // MARK: - Dependencies
    private var viewModel: ImageDetailsViewModelProtocol
    init(viewModel: ImageDetailsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - VC Lifecycle
    override func loadView() {
        view = imageDetailsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Functions
}
