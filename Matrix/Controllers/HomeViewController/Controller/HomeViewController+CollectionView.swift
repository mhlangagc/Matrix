//
//  HomeViewController+CollectionVIEW.swift
//  Matrix
//
//  Created by Gugulethu Mhlanga on 2022/02/01.
//

import UIKit

extension MovieViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.movieCast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let castCell = collectionView.dequeueReusableCell(withReuseIdentifier: ActorCollectionCell.identifier, for: indexPath) as? ActorCollectionCell else {
            return UICollectionViewCell()
        }
        castCell.actor = viewModel.movieCast[indexPath.item]
        return castCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
