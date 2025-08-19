//
//  jokeService.swift
//  JokesApp
//
//  Created by luis ramos on 19/08/2025.
//

import Foundation

protocol jokesServiceProtocol{
    func fetchRamdonJokes(completion: @escaping (Result<Joke, Error>) -> Void)
}
class JokeService: jokesServiceProtocol {
    func fetchRamdonJokes(completion: @escaping (Result<Joke, Error>) -> Void) {
        guard let url = URL(string: "https://official-joke-api.appspot.com/random_joke") else {
            completion(.failure(NSError(domain: "url invalida", code: -1)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error{
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "no data", code: -1)))
                return
            }
            do {
                let decodedJoke = try JSONDecoder().decode(Joke.self, from: data)
                completion(.success(decodedJoke))
            } catch {
                completion(.failure(error))
            }
        }.resume()
        
    }
}
