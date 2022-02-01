//
//  Colour.swift
//  Matrix
//
//  Created by Gugulethu Mhlanga on 2022/02/01.
//

import Foundation
import UIKit

struct Colour {

    private init() {}
    
    private static let `defaultColor` = UIColor()
    
    static let primary = hexToUIColor("F9F7F0")
    static let secondary = hexToUIColor("FFFDF9")
    
    // MARK: HexToUIColor
    static func hexToUIColor(_ hex: String) -> UIColor {
        var hexString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (hexString.hasPrefix("#")) {
            hexString.remove(at: hexString.startIndex)
        }

        if ((hexString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
