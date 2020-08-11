//
//  Extension+Double.swift
//  CoinTracker
//
//  Created by Nizzammuddin on 11/08/2020.
//  Copyright © 2020 Nizzammuddin. All rights reserved.
//

import Foundation

extension Double {
    
    func converting(from input: ClosedRange<Self>, to output: ClosedRange<Self>) -> Self {
        let x = (output.upperBound - output.lowerBound) * (self - input.lowerBound)
        let y = (input.upperBound - input.lowerBound)
        return x / y + output.lowerBound
    }
}
