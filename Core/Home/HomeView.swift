//
//  HomeView.swift
//  CryptoApp
//
//  Created by Nathan Patterson on 10/5/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                // Top Movers HStack Scroll
                TopMoversView(viewModel: viewModel)
                
                Divider()
                
                // All Coins View
                AllCoinsView(viewModel: viewModel)
            }
                .navigationTitle("Live Prices")
        }
    }
}

#Preview {
    HomeView()
}
