//
//  BaseCollectionViewCell.swift
//  Matrix
//
//  Created by Gugulethu Mhlanga on 2022/02/01.
//

import UIKit

public class BaseCollectionViewCell: UICollectionViewCell {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        configureView()
    }
    
    public func configureView() {
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Identifier
extension UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}
