//
//  ViewController.swift
//  Matrix
//
//  Created by Gugulethu Mhlanga on 2022/02/01.
//

import UIKit

final class MovieViewController: UIViewController {

    lazy var viewModel = HomeViewModel()
    
    lazy var movieCastCollectionView: UICollectionView = {
        let flowLayout = WatchCollectionFlowLayout()
        flowLayout.itemSize = 200
        flowLayout.spacing = -40
        flowLayout.nextItemScale = 0.4
        flowLayout.minScale = 0.2
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.alwaysBounceVertical = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradient()
        fetchMovieData()
        layoutView()
        registerCells()
    }

    private func setupGradient() {
        let layer = CAGradientLayer()
        layer.frame = view.frame
        layer.colors = [Colour.primary.cgColor,
                        Colour.secondary.cgColor]
        view.layer.addSublayer(layer)
    }
    
    private func layoutView() {
        view.addSubview(movieCastCollectionView)
        
        movieCastCollectionView.topAnchor ->> view.topAnchor
        movieCastCollectionView.rightAnchor ->> view.rightAnchor
        movieCastCollectionView.leftAnchor ->> view.leftAnchor
        movieCastCollectionView.height(view.frame.height)
    }
    
    private func registerCells() {
        movieCastCollectionView.register(ActorCollectionCell.self,
                                         forCellWithReuseIdentifier: ActorCollectionCell.identifier)
    }
}
