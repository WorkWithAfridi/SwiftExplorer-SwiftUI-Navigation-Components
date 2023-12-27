//
//  CoinServices.swift
//  SwiftExplorer
//
//  Created by Khondakar Afridi on 27/12/23.
//

import Foundation
class CoinServices{
    private var url = URL(string: "https://api.coingecko.com/api/v3/coins/list")
}

// MARK: - Using Async/Await
extension CoinServices{
    func fetchCoinListAsync() async throws -> Result<[CoinModel], CoinApiError>{
        do{
            let (data, response) = try await URLSession.shared.data(from: URL(string: "https://api.coingecko.com/api/v3/coins/list")!)
             print("DEBUG RES: \(response as? HTTPURLResponse)")
             print("DEBUG DATA: \(data)")
            let decodedCoinList = try JSONDecoder().decode([CoinModel].self, from: data)
            return .success(decodedCoinList)
        }catch{
            print("DEBUG ERROR: \(error.localizedDescription)")
            return .failure(.unknownError(error: error))
        }
    }
}


// MARK: - Using Completion Handler
extension CoinServices {
    
    // Without custom errors
    func getCoinList(completion: @escaping([CoinModel]?, Error?) -> Void) {
        URLSession.shared.dataTask(with: URL(string: "https://api.coingecko.com/api/v3/coins/list")! ) {
            data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            do {
                if let safeData = data {
                    let decodedCoinList = try JSONDecoder().decode([CoinModel].self, from: safeData)
                    print("Decoded coin list length: \(decodedCoinList.count)")
                    completion(decodedCoinList, nil)
                }
            } catch let error {
                print("Error decoding: ", error)
                completion(nil, error)
            }
        }.resume()
        
    }
    
    // With custom errors
    func fetchCoinList(completion: @escaping(Result<[CoinModel], CoinApiError>) -> Void) {
        URLSession.shared.dataTask(with: URL(string: "https://api.coingecko.com/api/v3/coins/list")! ) {
            data, response, error in
            if let error = error {
                completion(.failure(.unknownError(error: error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.requestFailed(description: "Request failed")))
                return
            }
            
            guard httpResponse.statusCode == 200 else {
                completion(.failure(.invalidStatusCode(statusCode: httpResponse.statusCode)))
                return
            }
            
            do {
                if let safeData = data {
                    let decodedCoinList = try JSONDecoder().decode([CoinModel].self, from: safeData)
                    print("Decoded coin list length: \(decodedCoinList.count)")
                    completion(.success(decodedCoinList))
                } else {
                    completion(.failure(.invalidData))
                }
            } catch let error {
                print("Error decoding: ", error)
                completion(.failure(.unknownError(error: error)))
            }
        }.resume()
        
    }
    
}



// MARK: - Custom Errors : For better error handling
enum CoinApiError: Error{
    case invalidData
    case jsonParsingFailure
    case requestFailed(description: String)
    case invalidStatusCode(statusCode: Int)
    case unknownError(error: Error)
    
    var customDescription: String {
        switch self {
        case .invalidData:
            return "Invalid data"
        case .jsonParsingFailure:
            return "Failed to parse JSON"
        case .requestFailed(let description):
            return "Request failed: \(description)"
        case .invalidStatusCode(let statusCode):
            return "Invalid Status Code: \(statusCode)"
        case .unknownError(let error):
            return "An unknow error occurred: \(error.localizedDescription)"
        }
    }
}
