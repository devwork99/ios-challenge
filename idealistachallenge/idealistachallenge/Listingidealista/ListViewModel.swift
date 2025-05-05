//
//  ListViewModel.swift
//  idealistachallenge
//
//  Created by Muhammad Yasir on 25/02/2025.
//

import Foundation
import Combine


class ListViewModel {
    
    
    private let networkService : NetworkService
    
    init(networkService:NetworkService){
        self.networkService = networkService
    }
    
    
    private let cancellable = Set<AnyCancellable>()
    
    
    let refreshSubject = PassthroughSubject<ListAction, Never>()
    
    
    // Output: Publisher emitting either data or an error
    var output: AnyPublisher<[ListElementIdealista], NetworkError> {
        refreshSubject
            .flatMap { _ in
                self.fetchTodos()
                    .catch { error in Fail(error: NetworkError.decodeError) } // Pass error to subscriber
            }
            .eraseToAnyPublisher()
    }
    
    //private var cancellables = Set<AnyCancellable>()
    
    
    // Fetch Data using NetworkManager
    private func fetchTodos() -> AnyPublisher<[ListElementIdealista], Error> {
        guard let url = URL(string: Endpoints().listing) else {
            return Fail(error: NetworkError.badURL).eraseToAnyPublisher()
        }
        
        return self.networkService.fetchData(url)
    }
    
    
    
    
    
    
    
    
}
