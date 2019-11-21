//
//  CharacterController.swift
//  RandMAPI
//
//  Created by Soul Master on 11/21/19.
//  Copyright © 2019 Mikki Helmer. All rights reserved.
//

import Foundation
import UIKit

class CharacterController {
    
    static func fetchCharacter(searchText: String, completion: @escaping (Result<[Character], CharacterAPIError>) -> Void) {
        
        guard let baseURL = URL(string: "https://rickandmortyapi.com/api/character/" ) else {
            completion(.failure(.invalidURL)); return }
        
        let finalURL = baseURL.appendingPathComponent(searchText).appendingPathExtension("json")
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(.serverError))
                return
            }
            guard let data = data else { completion(.failure(.noCharacter)); return }
            do {
                let topLevel = try JSONDecoder().decode(TopLevelDictionary.self, from: data)
                var rickMortys: [Character] = []
                for dict in topLevel.results {
                    let rickMorty = dict.character
                    rickMortys.append(rickMorty)
                }
                completion(.success(rickMortys))
            } catch {
                print(error.localizedDescription)
            }
            
        }
        .resume()
    }
    
    enum CharacterAPIError: LocalizedError {
        case invalidURL
        case serverError
        case noCharacter
        
    }
    
}
