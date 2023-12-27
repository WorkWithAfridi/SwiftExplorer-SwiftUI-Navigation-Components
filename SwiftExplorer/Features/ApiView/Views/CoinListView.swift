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
            if coinController.coinList.isEmpty {
                VStack{
                    Button {
                        
                    } label: {
                        Text("Get Coin using Async/Await")
                    }
                    Divider()
                    
                    Button {
                        
                    } label: {
                        Text("Get Coin using Completion Handler")
                    }
                    
                }
            }
        }
        .onAppear(perform: {
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
