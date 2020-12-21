import UIKit

class UserInfoView: UIView {

    // MARK: - UI
    private lazy var scrollView = UIScrollView()
    private lazy var contentView = UIView()

    lazy var photoImageView: UIImageView = {
        let photoImageView = UIImageView()
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.clipsToBounds = true
        photoImageView.layer.cornerRadius = 8
        return photoImageView
    }()

    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = .systemFont(ofSize: 19, weight: .semibold)
        nameLabel.numberOfLines = 0
        nameLabel.textAlignment = .center
        return nameLabel
    }()

    private lazy var bioLabel: UILabel = {
        let bioLabel = UILabel()
        bioLabel.font = .systemFont(ofSize: 24, weight: .bold)
        bioLabel.numberOfLines = 0
        bioLabel.textAlignment = .center
        bioLabel.text = "BIO"
        return bioLabel
    }()

    lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.font = .systemFont(ofSize: 14, weight: .regular)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.sizeToFit()
        return descriptionLabel
    }()

    // MARK: - Functions
    func setupUIElements() {
        backgroundColor = Colors.mainBG
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(photoImageView, nameLabel, bioLabel, descriptionLabel)

        setupScrollViewConstraints()
        setupContentViewConstraints()
        setupPhotoImageViewConstraints()
        setupNameLabelConstraints()
        setupBioLabelConstraints()
        setupDescriptionLabelConstraints()
    }

    // MARK: - Constraints
    private func setupScrollViewConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: widthAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func setupContentViewConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }

    private func setupPhotoImageViewConstraints() {
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            photoImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1 / 3),
            photoImageView.heightAnchor.constraint(equalTo: photoImageView.widthAnchor, multiplier: 4 / 3)
        ])
    }

    private func setupNameLabelConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16)
        ])
    }

    private func setupBioLabelConstraints() {
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bioLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            bioLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            bioLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 32),
            bioLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    private func setupDescriptionLabelConstraints() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            descriptionLabel.topAnchor.constraint(equalTo: bioLabel.bottomAnchor, constant: 32),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}
