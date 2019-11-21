//
//  Character.swift
//  RandMAPI
//
//  Created by Soul Master on 11/21/19.
//  Copyright © 2019 Mikki Helmer. All rights reserved.
//

import Foundation

struct TopLevelDictionary: Codable {
    let results: Character
        
    }

struct Character: Codable {
    let name: String
    let status: String
    let species: String
    var imageURL: String

    
//coding key
    
    enum CodingKeys: String, CodingKey {
        case imageURL = "image"
    }
}
