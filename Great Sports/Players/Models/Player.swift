//
//  Player.swift
//  Great Sports
//
//  Created by Thafer Shahin on 11/12/2023.
//

import Foundation

struct Player: Identifiable, Codable {
    let id: String
    let name: String
    let slug: String
    let teamName: String
    let rating: String
    let positionName: String
}
