//
//  NetworkManager.swift
//  DemoTestKoombea
//
//  Created by Fulvio A. Moya on 20/9/23.
//

import Foundation

class NetworkManager: NSObject {
    //FIXME: avoid hardcode this and move to .plist file
    private static let baseUrl = "https://jserver-api.herokuapp.com/"
    private static let userPath = baseUrl + "users"
    
    static let shared = NetworkManager()
    
    private override init() {}
    
    func getUser(_ completion: @escaping (Result<[Customer], Error>) -> Void)  {
        guard let url = URL(string: NetworkManager.userPath) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            var resultObject:[Customer]!

            guard let responseData = data else {
                return
            }
            
            do {
                let decoding = JSONDecoder()
                resultObject = try decoding.decode([Customer].self, from: responseData)
            } catch {
                completion(.failure(error))
            }
            
            completion(.success(resultObject))
        }
        
        task.resume()
    }
}
