//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by Nathan Patterson on 10/6/23.
//

import Foundation
import SwiftUI


class HomeViewModel: ObservableObject {
    @Published var coins = [Coin]()
    @Published var topMovingCoins = [Coin]()
    
    init() {
        fetchCoinData()
    }
    
    
    func fetchCoinData() {
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h&locale=en"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
// handle error
            if let error = error {
                print("DEBUG: Error \(error.localizedDescription)")
                return
            }
// handle response and print response code
            if let response = response as? HTTPURLResponse {
                print("DEBUG: Response code \(response.statusCode)")
            }
// make sure we get data back
            guard let data = data else { return }
// decode into an array of coin
            do {
                let coins = try JSONDecoder().decode([Coin].self, from: data)
// store the decoded array of coins into the @Publsihed property "coins"
                DispatchQueue.main.async {
                    self.coins = coins
                    self.configureTopMovingCoins()
                }
            } catch let error {
                print("DEBUG: Failed to decode with error: \(error)")
            }
            
        } .resume()
    }
    
    // sort coins by priceChangePercentage24H
    func configureTopMovingCoins() {
        let topMovers = coins.sorted(by: {$0.priceChangePercentage24H > $1.priceChangePercentage24H})
        self.topMovingCoins = Array(topMovers.prefix(5))
    
    }
}
