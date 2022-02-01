//
//  DispatchOnMain.swift
//  Matrix
//
//  Created by Gugulethu Mhlanga on 2022/02/01.
//

import Foundation

final class Dispatch {
    
    static func onMainThread(_ action: @escaping () -> Void) {
        if Thread.isMainThread {
            action()
        } else {
            DispatchQueue.main.async {
                action()
            }
        }
    }
    
}
