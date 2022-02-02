//
//  ActorCollectionCell.swift
//  Matrix
//
//  Created by Gugulethu Mhlanga on 2022/02/01.
//

import Foundation
import UIKit

final class ActorCollectionCell: BaseCollectionViewCell {
    
    var actor: Actor? {
        didSet {
            guard let actor = actor, let image = actor.image else { return }
            if oldValue?.image != image {
                actorImageView.displayImage(fromPath: image)
            }
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.1, animations: {
                self.transform = self.isHighlighted ? CGAffineTransform(scaleX: 0.9, y: 0.9) : CGAffineTransform.identity
                self.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            UIView.animate(withDuration: 0.1, animations: {
                self.transform = self.isSelected ? CGAffineTransform(scaleX: 0.9, y: 0.9) : CGAffineTransform.identity
                self.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    lazy var actorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = frame.width * 0.5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func configureView() {
        super.configureView()
        layoutView()
        layer.cornerRadius = frame.width * 0.5
    }
    
    private func layoutView() {
        addSubview(actorImageView)
        actorImageView.constrain(to: self)
    }
}
