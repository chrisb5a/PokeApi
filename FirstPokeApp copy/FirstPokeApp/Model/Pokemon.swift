//
//  Pokemon.swift
//  FirstPokeApp
//
//  Created by CHRISTIAN BEYNIS on 7/15/22.
//

import Foundation

// MARK: - PokeAPIElement


import Foundation

enum PokemonElement: Codable {
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
        throw DecodingError.typeMismatch(PokemonElement.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for PokemonElement"))
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

typealias Pokemon = [String: [PokemonElement]]

//enum PokemonElement: Codable {
//    case string(String)
//    case stringArray([String])
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if let x = try? container.decode([String].self) {
//            self = .stringArray(x)
//            return
//        }
//        if let x = try? container.decode(String.self) {
//            self = .string(x)
//            return
//        }
//        throw DecodingError.typeMismatch(PokemonElement.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for PokemonElement"))
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        switch self {
//        case .string(let x):
//            try container.encode(x)
//        case .stringArray(let x):
//            try container.encode(x)
//        }
//    }
//}
//
//typealias Pokemon = [String: [PokemonElement]]




//struct Pokemon : Codable {
//    let abilities: [[String:[String]]]
//    let types: [[String:[String?]]]
//    let sprite: [[String: String?]]
//    let moves: [[String:[String?]]]
//    let url: [[String: String?]]
//
//        enum CodingKeys: String, CodingKey {
//            case abilities = "Abilities"
//            case types = "Types"
//            case sprite = "Sprite"
//            case moves = "Moves"
//            case url = "Url"
//        }
//}
//
//struct Abi : Codable {
//
//}


//struct PokeAPIElement: Codable {
//    let abilities, types: [String]?
//    let sprite: String?
//    let moves: [String]?
//    let url: String?
//
//    enum CodingKeys: String, CodingKey {
//        case abilities = "Abilities"
//        case types = "Types"
//        case sprite = "Sprite"
//        case moves = "Moves"
//        case url = "Url"
//    }
//}
//
//typealias Pokemon = [String: [PokeAPIElement]]

//struct PokeAPIElement: Codable {
//    let abilities: [String:[String]]
//    let types: [String: String]
//    let sprite: [String: String]
//    let moves: [String:[String]]
//    let url: [String:String]
//
//    enum CodingKeys: String, CodingKey {
//        case abilities = "Abilities"
//        case types = "Types"
//        case sprite = "Sprite"
//        case moves = "Moves"
//        case url = "Url"
//    }
//}
//
//typealias Pokemon = [String: [PokeAPIElement]]
