//
//  CoinController.swift
//  SwiftExplorer
//
//  Created by Khondakar Afridi on 27/12/23.
//

import Foundation

class CoinController : ObservableObject{
    @Published var coinList = [CoinModel]()
    @Published var errorMessage: String?
    
    private var coinService = CoinServices()
    
    func getCoinsAsync() async throws {
        errorMessage = nil
        let result: Result = try await coinService.fetchCoinListAsync()
        
        switch result {
        case .success(let coins):
            DispatchQueue.main.async{
                self.coinList = coins
            }
        case .failure(let failure):
            DispatchQueue.main.async{
                self.errorMessage = failure.localizedDescription
            }
        }
    }
    
    func getCoinUsingCompletionHandler() {
        errorMessage = nil
        coinService.getCoinList { apiCoinList, error in
            if let errorNotNil = error {
                DispatchQueue.main.async{
                    self.errorMessage = errorNotNil.localizedDescription
                }
            }
            if let safeCoinList = apiCoinList {
                DispatchQueue.main.async{
                    self.coinList = safeCoinList
                }
            }
        }
    }
}

