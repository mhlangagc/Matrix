//
//  ViewController.swift
//  Matrix
//
//  Created by Gugulethu Mhlanga on 2022/02/01.
//

import UIKit

final class HomeViewController: UIViewController {

    lazy var viewModel = HomeViewModel()
//    lazy var newsCollectionView: UICollectionView = {
//        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.scrollDirection = .vertical
//        flowLayout.minimumLineSpacing = 10.0
//        flowLayout.minimumInteritemSpacing = 0.0
//        let collectionView = UICollectionView(frame: .zero,
//                                              collectionViewLayout: flowLayout)
//        collectionView.contentInset = contentInsert
//        collectionView.backgroundColor = Colour.white
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.alwaysBounceVertical = true
//        collectionView.showsVerticalScrollIndicator = false
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        return collectionView
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradient()
        fetchMovieData()
    }

    private func setupGradient() {
        let layer = CAGradientLayer()
        layer.frame = view.frame
        layer.colors = [Colour.primary.cgColor,
                        Colour.secondary.cgColor]
        view.layer.addSublayer(layer)
    }
}
