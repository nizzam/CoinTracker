//
//  ContentView.swift
//  CoinTracker
//
//  Created by Nizzammuddin on 10/08/2020.
//  Copyright © 2020 Nizzammuddin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var viewModel = CoinListViewModel()
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        UITableViewCell.appearance().selectionStyle = .none
        
        viewModel.getCoins()
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.base
            List {
                VStack(alignment: .center) {
                    Text("Coin Tracker")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.top, 50)
                        .neumorphicShadow()
                    
                    ForEach(viewModel.coins) { coin in
                        CoinCell(coin: coin)
                        .neumorphicShadow()
                    }
                }
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
