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
        setupView()
        setupNavigationBar()
    }

    // MARK: - Functions
    private func setupView() {
        imageDetailsView.setupUIElements()
        viewModel.setImage(to: imageDetailsView.imageView)
    }

    private func setupNavigationBar() {
        navigationItem.title = viewModel.navBarTitle

        let saveButtonItem = UIBarButtonItem(barButtonSystemItem: .save,
                                             target: self,
                                             action: #selector(saveButtonPressed))

        navigationItem.rightBarButtonItem = saveButtonItem

    }

    // MARK: - Actions
    @objc
    private func saveButtonPressed() {
        guard let image = imageDetailsView.imageView.image else { return }
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(self.image(_:didFinishSavingWithError:contextInfo:)), nil)
    }

    @objc
    func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            presentAlert(title: "Error", message: error.localizedDescription)
        } else {
            presentAlert(title: "Success", message: "The image was saved to the library ")
        }
    }
}
