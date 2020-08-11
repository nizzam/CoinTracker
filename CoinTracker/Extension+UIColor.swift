//
//  Extension+UIColor.swift
//  CoinTracker
//
//  Created by Nizzammuddin on 11/08/2020.
//  Copyright © 2020 Nizzammuddin. All rights reserved.
//

import SwiftUI

extension Color {
    
    static let base = Color(#colorLiteral(red: 0.2559898496, green: 0.3334172964, blue: 0.3991098404, alpha: 1))
    static let grayish = Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
    static let greenish = Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
    static let darkShadow = Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
    
    init(hex: String) {
        self.init(UIColor(hex: hex))
    }
}

extension UIColor {
    
    convenience init(hex: String) {
        var inputString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if inputString.hasPrefix("#") {
            inputString.remove(at: inputString.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        
        Scanner(string: inputString).scanHexInt64(&rgbValue)
        
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
