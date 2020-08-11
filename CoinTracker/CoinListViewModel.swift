//
//  CoinListViewModel.swift
//  CoinTracker
//
//  Created by Nizzammuddin on 11/08/2020.
//  Copyright © 2020 Nizzammuddin. All rights reserved.
//

import SwiftUI
import Combine

class CoinListViewModel: ObservableObject {
    @Published var coins = [CoinViewModel]()
    
    private let coinService = CoinService()
    
    var cancellable: AnyCancellable?
    
    func getCoins() {
        guard let getCoins = coinService.getCoins() else {
            print("no data")
            return
        }
        
        cancellable = getCoins.sink(receiveCompletion: { (err) in
                        print(err)
                    }) { (response) in
                        self.coins = response.data.coins.map { CoinViewModel($0) }
                    }
    }
}

