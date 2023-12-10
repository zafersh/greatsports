//
//  PlayersResponse.swift
//  Great Sports
//
//  Created by Thafer Shahin on 11/12/2023.
//

import Foundation

struct PlayersResponse: Codable {
    let data: [Player]
    let message: String
}
