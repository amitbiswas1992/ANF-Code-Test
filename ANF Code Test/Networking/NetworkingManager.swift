//
//  NetworkingManager.swift
//  ANF Code Test
//
//  Created by Amit Biswas on 8/9/21.
//

import Foundation

enum NetworkError: String, Error {
    case serverError = "Server Error"
}

final class NetworkingManager {
    
    //MARK: - Shared Instance
    static let shared = NetworkingManager()
    
    
    //MARK: - Initializers
    private init () { }
        
    
    //MARK: - Top Articles Fetching Api
    func fetchAllProducts(completionHandler: @escaping (Result<[Product], NetworkError>) -> Void ) {
        
        guard let url = URL(string: AppConstants.Endpoint.FETCH_PRODUCTS)  else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard let data = data else {
                completionHandler(.failure(.serverError))
                return
            }
            
            do {
                
                let productsList = try JSONDecoder().decode([Product].self, from: data)
                completionHandler(.success(productsList))
                
                
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
        })
        task.resume()
    }
    
    //MARK: - Download Image
    func downloadImageData(from url: URL, completion: @escaping (_ data: Data?) -> () ) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil else {
                completion(nil)
                return
            }
            
            completion(data)
            
        }.resume()
    }
}
