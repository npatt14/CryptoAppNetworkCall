//
//  AllCoinsView.swift
//  CryptoApp
//
//  Created by Nathan Patterson on 10/5/23.
//

import SwiftUI

struct AllCoinsView: View {
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("All Coins")
                .font(.headline)
                .padding()
        }
        
        HStack {
            Text("Coin")
            
            Spacer()
            
            Text("Prices")
        }
        .font(.caption)
        .foregroundStyle(.gray)
        .padding(.horizontal)
        
        ScrollView {
            VStack {
                ForEach(viewModel.coins) { coin in
                    CoinRowView(coin: coin)
                }
            }
        }
        
        
        
    }
}

//#Preview {
//    AllCoinsView()
//}
