//
//  NetworkManager.swift
//  idealistachallenge
//
//  Created by Muhammad Yasir on 28/02/2025.
//

import Foundation
import Combine


let baseUrl = "https://idealista.github.io/ios-challenge"

struct Endpoints {
    
    var listing : String { return baseUrl + "/list.json" }
    var details : String { return baseUrl + "/detail.json" }
}


enum NetworkError : Error {
    case badURL
    case badResponse
    case decodeError
}


protocol NetworkService {
    func fetchData<T: Decodable>(_ url: URL) -> AnyPublisher<T, Error>
}

class NetworkManager : NetworkService {
    
        
    func fetchData<T: Decodable>(_ url: URL) -> AnyPublisher<T, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    throw NetworkError.badResponse
                }
                return data
            }
            .receive(on: DispatchQueue.main)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
        

    
    
}
