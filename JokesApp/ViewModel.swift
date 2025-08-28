//
//  ViewModel.swift
//  JokesApp
//
//  Created by luis ramos on 19/08/2025.
//

import Foundation

class JokeViewModel: ObservableObject {
    @Published var joke: Joke?
    @Published var isloading = false
    @Published var errorMessage: String?
    
    private let service: jokesServiceProtocol
    
    init(service: jokesServiceProtocol){
        self.service = service
        
    }
  
    func fetchRandomJoke(){
        isloading = true
        errorMessage = nil
        service.fetchRamdonJokes { [weak self] result in
            DispatchQueue.main.async {
                self?.isloading = false
                
                switch result {
                
                case .success(let joke):
                self?.joke = joke
                case.failure( let error ):
                    self?.errorMessage = error.localizedDescription
                    
                }
            }
        }
    }
    
}
