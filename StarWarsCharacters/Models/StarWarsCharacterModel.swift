//
//  StarWarsCharacterModel.swift
//  StarWarsCharacters
//
//  Created by DarkBringer on 16.10.2021.
//

import Foundation

// MARK: - StarWars

//
// To read values from URLs:
//
//   let task = URLSession.shared.resultTask(with: url) { result, response, error in
//     if let result = result {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Result
struct SWCharacter: Codable {
    let id: Int?
    let name: String?
    let height, mass: Double?
    let gender: Gender?
    let homeworld: String?
    let wiki: String?
    let image: String?
    let born: Born?
    let bornLocation: String?
    let died: Int?
    let diedLocation, species, hairColor, eyeColor: String?
    let skinColor: String?
    let cybernetics: Apprentices?
    let affiliations: [String]?
    let masters, apprentices: Apprentices?
    let formerAffiliations: [String]?
    let dateCreated, dateDestroyed: Int?
    let destroyedLocation, creator, manufacturer, model: String?
    let resultClass, sensorColor, platingColor: String?
    let equipment: Apprentices?
    let productLine, kajidic: String?
    let era: Apprentices?
    let degree: String?
    let armament: Apprentices?
    
    enum CodingKeys: String, CodingKey {
        case id, name, height, mass, gender, homeworld, wiki, image, born, bornLocation, died, diedLocation, species, hairColor, eyeColor, skinColor, cybernetics, affiliations, masters, apprentices, formerAffiliations, dateCreated, dateDestroyed, destroyedLocation, creator, manufacturer, model
        case resultClass = "class"
        case sensorColor, platingColor, equipment, productLine, kajidic, era, degree, armament
    }
}

enum Apprentices: Codable {
    case string(String)
    case stringArray([String])
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([String].self) {
            self = .stringArray(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Apprentices.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Apprentices"))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
            case .string(let x):
                try container.encode(x)
            case .stringArray(let x):
                try container.encode(x)
        }
    }
}

enum Born: Codable {
    case integer(Int)
    case string(String)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Born.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Born"))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
            case .integer(let x):
                try container.encode(x)
            case .string(let x):
                try container.encode(x)
        }
    }
}

enum Gender: String, Codable {
    case female = "female"
    case male = "male"
}

