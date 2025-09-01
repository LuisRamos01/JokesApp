//
//  Model.swift
//  JokesApp
//
//  Created by luis ramos on 19/08/2025.
//

import Foundation
 

struct Joke: Codable, Identifiable {
    let id: Int
    let  type: String
    let setup:   String
    let punchline: String
}
