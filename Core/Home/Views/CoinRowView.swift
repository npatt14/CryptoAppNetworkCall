//
//  CoinRowView.swift
//  CryptoApp
//
//  Created by Nathan Patterson on 10/5/23.
//

import SwiftUI
import Kingfisher

struct CoinRowView: View {
    let coin: Coin
    var body: some View {
        HStack {
            // Market Cap rank
            Text("\(coin.marketCapRank ?? 000)")
                .font(.caption)
                .foregroundStyle(.gray)
            
            // Image
            KFImage(URL(string: coin.image))
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .foregroundStyle(.orange)
            
            // coin name info
            VStack(alignment: .leading, spacing: 4) {
                Text(coin.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .padding(.leading, 6)
            }
            .padding(.leading, 2)
            
            Spacer()
            
            // coin price info
            
            VStack(alignment: .trailing, spacing: 4) {
                Text(coin.currentPrice.toCurrencyWith2Decimals())
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                
                Text(coin.priceChangePercentage24H.toPercentString())
                    .font(.caption)
                    .padding(.leading, 6)
                    .foregroundStyle(coin.priceChangePercentage24H > 0 ? .green : .red)
            }
            .padding(.trailing, 2)
            
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

//#Preview {
//    CoinRowView()
//}
