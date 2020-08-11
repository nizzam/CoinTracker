//
//  GraphView.swift
//  CoinTracker
//
//  Created by Nizzammuddin on 11/08/2020.
//  Copyright © 2020 Nizzammuddin. All rights reserved.
//

import SwiftUI

struct GraphView: View {
    
    @State private var on = false
    
    var data: [Double]
    var strokeColor: Color = .blue
    
    var body: some View {
        VStack {
            LineGraph(dataPoints: data)
                .trim(to: on ? 1: 0)
                .stroke(strokeColor, lineWidth: 2)
                .aspectRatio(16/9, contentMode: .fit)
                .border(Color.base, width: 1)
                .padding()
                .onAppear {
                    withAnimation(Animation.easeInOut(duration: 2)) {
                        self.on.toggle()
                    }
            }
            
        }
    }
}
