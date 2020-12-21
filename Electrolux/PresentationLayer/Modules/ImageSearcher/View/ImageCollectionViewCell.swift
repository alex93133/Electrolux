import UIKit
import Kingfisher

class ImageCollectionViewCell: UICollectionViewCell, ConfigurableView {

    typealias ConfigurationModel = ImageCollectionViewCellModelProtocol

    // MARK: - UI
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUIElements()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Functions
    private func setupUIElements() {
        addSubviews(imageView)
        setupImageViewConstraints()
    }

    func configure(with model: ConfigurationModel) {
        imageView.kf.setImage(with: model.imageURL)
    }

    // MARK: - Constraints
    private func setupImageViewConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
