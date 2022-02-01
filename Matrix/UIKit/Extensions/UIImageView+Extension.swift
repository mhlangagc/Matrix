//
//  UIImageView+Extension.swift
//  Matrix
//
//  Created by Gugulethu Mhlanga on 2022/02/01.
//

import UIKit
import Kingfisher

extension UIImageView {

    func displayImage(fromPath imagePath: String) {
        guard let url = URL(string: imagePath) else { return }
        self.kf.setImage(with: url)
    }
}
