//
//  CoinService.swift
//  CoinTracker
//
//  Created by Nizzammuddin on 10/08/2020.
//  Copyright © 2020 Nizzammuddin. All rights reserved.
//

import Foundation
import Combine

final class CoinService {
    
//    let url = URL(string: "https://api.coinranking.com/v1/public/coins?base=USD&timePeriod=7d&symbols=btc,eth,usdt,xrp,bch,ada,ltc,cro")
    
    let symbols = ["btc","eth","usdt","xrp","bch","ada","ltc","cro"]
    
    lazy var urlComponents: URLComponents = {
        var component = URLComponents()
        component.scheme = "https"
        component.host = "api.coinranking.com"
        component.path = "/v1/public/coins"
        component.queryItems = [
            URLQueryItem(name: "base", value: "USD"),
            URLQueryItem(name: "timePeriod", value: "7d"),
            URLQueryItem(name: "symbols", value: symbols.joined(separator: ",")),
        ]
        return component
    }()
    
    func getCoins() -> AnyPublisher<CoinResponse, Error>? {
        guard let url = urlComponents.url else { return nil }
        
        print(url)
        
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: CoinResponse.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
