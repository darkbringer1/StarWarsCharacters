//
//  EndPointManager.swift
//  StarWarsCharacters
//
//  Created by DarkBringer on 16.10.2021.
//

import Foundation

typealias BaseURL = EndPointManager.BaseURL
typealias Paths = EndPointManager.Paths
enum EndPointManager {
    
    enum BaseURL: CustomStringConvertible {
        case main
        
        var description: String {
            switch self {
                case .main:
                    return "https://darkbringer1.github.io/api"
            }
        }
    }
    
    enum Paths: CustomStringConvertible {
        
        case characterWithID(Int)
        case allCharacters
        
        var description: String {
            switch self {
                case .characterWithID(let id):
                    return "/id/\(id)"
                case .allCharacters:
                    return "/all.json"
            }
        }
    }
    
}
