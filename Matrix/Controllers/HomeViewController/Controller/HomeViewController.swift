//
//  ViewController.swift
//  Matrix
//
//  Created by Gugulethu Mhlanga on 2022/02/01.
//

import UIKit
import WatchLayout
import RxSwift

final class MovieViewController: UIViewController {

    lazy var viewModel = HomeViewModel()
    var bag = DisposeBag()
    
    lazy var flowLayout: WatchLayout = {
        let flowLayout = WatchLayout()
        flowLayout.itemSize = 150
        flowLayout.spacing = -40
        flowLayout.nextItemScale = 0.3
        flowLayout.minScale = 0.15
        return flowLayout
    }()
    
    lazy var movieCastCollectionView: UICollectionView = {
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
        // fetchMovieData()
        bindToViewModel()
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
