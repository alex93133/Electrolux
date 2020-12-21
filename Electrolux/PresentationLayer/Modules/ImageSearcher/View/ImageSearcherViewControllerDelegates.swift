import UIKit

// MARK: - CollectionView
extension ImageSearcherViewController: UICollectionViewDelegate,
                                       UICollectionViewDataSource,
                                       UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItemsInSection()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.imageCollectionViewCell,
                                                         for: indexPath) as? ImageCollectionViewCell {

            viewModel.setImage(to: cell.imageView, indexPath: indexPath)
            return cell
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelectItemAt(indexPath: indexPath)
    }

    func collectionView( _ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.imageCollectionViewCell,
                                                         for: indexPath) as? ImageCollectionViewCell {
            cell.imageView.kf.cancelDownloadTask()
        }
    }
}

// MARK: - SearchBar
extension ImageSearcherViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
        guard let text = searchBar.text else { return }
        imageSearcherView.activityIndicator.startAnimating()
        viewModel.getData(search: text)
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        imageSearcherView.collectionView.isUserInteractionEnabled = false
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        imageSearcherView.collectionView.isUserInteractionEnabled = true
    }
}

// MARK: - ViewModel
extension ImageSearcherViewController: ImageSearcherViewModelDelegate {
    func presentError(error: Error) {
        presentAlert(title: "Error", message: error.localizedDescription)
    }

    func dataDidUpdate() {
        imageSearcherView.activityIndicator.stopAnimating()
        imageSearcherView.collectionView.reloadData()
    }

    func presentImageDetailsViewController(_ imageDetailsViewController: ImageDetailsViewController) {
        navigationController?.pushViewController(imageDetailsViewController, animated: true)
    }
}
