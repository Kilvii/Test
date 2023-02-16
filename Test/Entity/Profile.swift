//
//  Profile.swift
//  Test
//
//  Created by User on 01.02.2023.
//

import Foundation

struct Profile: Codable {
    typealias ID = String
    
    let id: ID
    let firstName: String?
    let lastName: String?
    let birthDay: Date?
}

