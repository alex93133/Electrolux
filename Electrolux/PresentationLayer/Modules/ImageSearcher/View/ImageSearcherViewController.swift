import UIKit

class ImageSearcherViewController: UIViewController {

    // MARK: - Properties
    lazy var imageSearcherView: ImageSearcherView = {
        let view = ImageSearcherView(frame: UIScreen.main.bounds)
        return view
    }()

    // MARK: - Dependencies
    private var viewModel: ImageSearcherViewModelProtocol
    init(viewModel: ImageSearcherViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Functions
}
