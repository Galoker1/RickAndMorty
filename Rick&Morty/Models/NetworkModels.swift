//
//  Character.swift
//  Rick&Morty
//
//  Created by Егор  Хлямов on 16.08.2023.
//

import Foundation

// MARK: - Welcome
struct AllCharacter: Decodable {
    var results: [Character]
    var info:Info
}


// MARK: - Result
struct Character: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Origin
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}


// MARK: - Location
struct Location: Decodable {
    let name: String
    let url: String
}

struct Origin: Decodable {
    let name: String
    let url: String
}

struct Info: Decodable {
    let pages: Int
    let next: String
}

struct Episode:Decodable{
    let name:String
    let air_date:String
    let episode: String
}

struct Planet:Decodable{
    let name: String
    let type: String
}
