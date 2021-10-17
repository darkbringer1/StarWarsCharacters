//
//  StarWarsCharacterModel.swift
//  StarWarsCharacters
//
//  Created by DarkBringer on 16.10.2021.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let starwars = try? newJSONDecoder().decode(Starwars.self, from: jsonData)

// MARK: - Starwar
struct SWCharacter: Codable {
    
    let id: Int
    let name: String
    let height: Double?
    let mass: Double?
    let gender: String?
    let homeworld: String?
    let wiki: String?
    let image: URL?
    let born: Int?
    let died: Int?
    let species: String?
    let affiliations: [String]?
    let masters: [String]?
    let apprentices: [String]?
    let equipment: [String]?
    
}

struct SWList: Codable {
    let result: [SWCharacter]
}
