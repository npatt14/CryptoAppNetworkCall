//
//  TopMoversView.swift
//  CryptoApp
//
//  Created by Nathan Patterson on 10/5/23.
//

import SwiftUI

struct TopMoversView: View {
    @StateObject var viewModel: HomeViewModel
    var body: some View {
        VStack(alignment: .leading) {
            Text("Top Movers")
                .font(.headline)
            
            ScrollView(.horizontal) {
                HStack(spacing: 12) {
                    ForEach(viewModel.topMovingCoins) { coin in
                        TopMoversItemView(coin: coin)
                    }
                }
            }
        }
        .padding(9)
    }
}

#Preview {
    TopMoversView(viewModel: HomeViewModel())
}
