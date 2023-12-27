//
//  CoinListView.swift
//  SwiftExplorer
//
//  Created by Khondakar Afridi on 27/12/23.
//

import SwiftUI

struct CoinListView: View {
    @StateObject private var coinController = CoinController()
    var body: some View {
        VStack{
            if coinController.errorMessage != nil {
                ContentUnavailableView("404", systemImage: "globe", description: Text(coinController.errorMessage ?? "An error occurred when trying to fetch coin data.") )
            }
            else if coinController.coinList.isEmpty {
                VStack{
                    Button {
                        Task{
                            try await coinController.getCoinsAsync()
                        }
                    } label: {
                        Text("Get Coin using Async/Await")
                    }
                    Divider()
                    
                    Button {
                        coinController.getCoinUsingCompletionHandler()
                    } label: {
                        Text("Get Coin using Completion Handler")
                    }
                    
                }
            }
            else if !coinController.coinList.isEmpty{
                List {
                    ForEach(coinController.coinList, id: \.id){ coin in
                        Text(coin.name ?? "NO-COIN-NAME")
                    }
                }
            }
        }
        .onAppear(perform: {
            //            Task{
            //                try await coinController.getCoinsAsync()
            //            }
            print("CoinListView Appeared")
        })
        .onDisappear(perform: {
            print("CoinListView Disappeared")
        })
        .navigationTitle(Text("Coin List"))
    }
}

#Preview {
    CoinListView()
}
