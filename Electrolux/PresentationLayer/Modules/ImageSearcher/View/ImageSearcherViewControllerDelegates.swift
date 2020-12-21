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

            let cellModels = viewModel.getCellModel()
            let cellModel = cellModels[indexPath.item]
            cell.configure(with: cellModel)
            return cell
        }
        return UICollectionViewCell()
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
    func dataDidUpdate() {
        imageSearcherView.activityIndicator.stopAnimating()
        imageSearcherView.collectionView.reloadData()
    }
}
