import UIKit

class ImageSearcherViewController: UIViewController {

    // MARK: - Properties
    lazy var imageSearcherView: ImageSearcherView = {
        let view = ImageSearcherView(frame: UIScreen.main.bounds)
        return view
    }()

    // MARK: - Dependencies
    var viewModel: ImageSearcherViewModelProtocol
    init(viewModel: ImageSearcherViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - VC Lifecycle
    override func loadView() {
        view = imageSearcherView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigationBar()
        hideKeyboardWhenTappedOutside()
        viewModel.delegate = self
    }

    // MARK: - Functions
    private func setupView() {
        imageSearcherView.setupUIElements()
        imageSearcherView.collectionView.delegate = self
        imageSearcherView.collectionView.dataSource = self
        imageSearcherView.searchBar.delegate = self
        imageSearcherView.collectionView.register(ImageCollectionViewCell.self,
                                                  forCellWithReuseIdentifier: Identifiers.imageCollectionViewCell)
    }

    private func setupNavigationBar() {
        navigationItem.title = "Image searcher"
    }
}
