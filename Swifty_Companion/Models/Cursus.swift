//
//  Cursus.swift
//  Swifty_Companion
//
//  Created by Téo Froissart on 25/06/2024.
//

import Foundation

// MARK: - CursusUser
struct CursusUser: Codable, Identifiable {
    let id: Int
    let grade: String?
    let level: Float?
    let skills: [Skill]
    let cursusID: Int
    let hasCoalition: Bool
    let cursus: CursusDigest

    enum CodingKeys: String, CodingKey {
        case id, grade, level
        case skills
        case cursusID = "cursus_id"
        case hasCoalition = "has_coalition"
        case cursus
    }
}

// MARK: - CursusDigest
struct CursusDigest: Codable {
    let id: Int
    let name: String
    let slug: String

    enum CodingKeys: String, CodingKey {
        case id, name, slug
    }
}

// MARK: - Skill
struct Skill: Codable, Identifiable {
    let id: Int
    let name: String
    let level: Float

    enum CodingKeys: String, CodingKey {
        case id, name, level
    }
}
