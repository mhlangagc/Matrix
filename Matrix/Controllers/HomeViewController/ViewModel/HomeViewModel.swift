//
//  HomeViewModel.swift
//  Matrix
//
//  Created by Gugulethu Mhlanga on 2022/02/01.
//

import Foundation

struct HomeViewModel {
    
    lazy var coordinator = resolve(MatrixNetworkProtocol.self)
    
    func fetchData() {
        
    }
}
