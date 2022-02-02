//
//  HomeViewController+Networking.swift
//  Matrix
//
//  Created by Gugulethu Mhlanga on 2022/02/01.
//

import Foundation

extension MovieViewController {
    
    func fetchMovieData() {
        viewModel.fetchMovie()
    }
    
    func bindToViewModel() {
        
        viewModel.movieCast.bind(to: movieCastCollectionView.rx.items()
        
        viewModel.movieCastArray = { [weak self] actors in
            Dispatch.onMainThread {
                guard let self = self else { return }
                self.movieCastCollectionView.reloadData()
//                Dispatch.onMainThread {
//                    let indexPath = IndexPath(item: 0, section: 0)
//                    self.movieCastCollectionView.setContentOffset(self.flowLayout.centeredOffsetForItem(indexPath: indexPath),
//                                                                  animated: true)
//                }
            }
        }
    }
}
