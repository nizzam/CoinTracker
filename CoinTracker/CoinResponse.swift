//
//  CoinResponse.swift
//  CoinTracker
//
//  Created by Nizzammuddin on 11/08/2020.
//  Copyright © 2020 Nizzammuddin. All rights reserved.
//

struct CoinResponse: Decodable {
    let status: String
    let data: CoinData
}

struct CoinData: Decodable {
    let coins: [Coin]
}

struct Coin: Decodable {
    let name: String
    let price: String
    let symbol: String
    let color: String
    let change: Double
    let history: [String]
}
