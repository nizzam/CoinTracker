//
//  CoinViewModel.swift
//  CoinTracker
//
//  Created by Nizzammuddin on 11/08/2020.
//  Copyright © 2020 Nizzammuddin. All rights reserved.
//

import SwiftUI

struct CoinViewModel: Identifiable {
    var id: UUID { return UUID() }
    
    private let coin: Coin
    
    var name: String {
        return coin.name
    }
    
    var formattedPrice: String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        return formatter.string(from: Double(coin.price)! as NSNumber)!
    }
    
    var symbol: String {
        return coin.symbol.lowercased()
    }
    
    var defaultImage: UIImage {
        return #imageLiteral(resourceName: "bitcoin")
    }
    
    var color: Color {
        return Color(hex: coin.color)
    }
    
    var change: Double {
        return coin.change
    }
    
    var history: [Double] {
        let historyNumbers = coin.history.map { Double($0)! }
        
        let min = historyNumbers.min()!
        let max = historyNumbers.max()!
        
        var computedValues = [Double]()
        for item in historyNumbers {
            computedValues.append(item.converting(from: min...max, to: 0...1))
        }
        
        return computedValues
    }
    
    init(_ coin: Coin) {
        self.coin = coin
    }
}
