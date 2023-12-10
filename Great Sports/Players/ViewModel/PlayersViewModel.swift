//
//  PlayersViewModel.swift
//  Great Sports
//
//  Created by Thafer Shahin on 11/12/2023.
//

import Foundation

class PlayersViewModel: ObservableObject {
    let playersUrl = "https://datasport.one/api/v1/sportscore/data/player.php"
    @Published var players: [Player] = []
    
    /**
     Load players list from GET https://datasport.one/api/v1/sportscore/data/player.php
     */
    func fetchPlayers() {
        guard let url = URL(string: playersUrl) else {
            print("Invalid Players API URL: \(playersUrl)")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else {
                print("Invalid response from Players API.")
                return
            }
            
            do {
                let players = try JSONDecoder().decode(PlayersResponse.self, from: data)
                DispatchQueue.main.async {
                    self.players = players.data
                }
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}
