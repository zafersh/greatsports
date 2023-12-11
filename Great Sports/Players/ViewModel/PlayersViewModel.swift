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
        // Players API will not work as iOS will not send GET request when it has httpBody.
        // To fix this, load players response from players.json.
        guard let playersFile = Bundle.main.url(forResource: "players.json", withExtension: nil) else {
            print("Couldn't fine players.json")
            return
        }
        
        do {
            let data = try Data(contentsOf: playersFile)
            let players = try JSONDecoder().decode(PlayersResponse.self, from: data)
            DispatchQueue.main.async {
                self.players = players.data
            }
        } catch let error {
            print(error.localizedDescription)
        }
        
        // Code below will not work, GET API should be fixed to receive the parameters in URL
//        guard let url = URL(string: playersUrl) else {
//            print("Invalid Players API URL: \(playersUrl)")
//            return
//        }
//        let params: [String: Any] = ["lang":"en",
//                      "page": 1]
//        let jsonParams = try? JSONSerialization.data(withJSONObject: params)
//        var urlRequest = URLRequest(url: url)
//        urlRequest.httpBody = jsonParams
//        urlRequest.httpMethod = "GET"
//        
//        
//        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
//            if let error = error {
//                print(error.localizedDescription)
//                return
//            }
//            
//            guard let data = data else {
//                print("Invalid response from Players API.")
//                return
//            }
//            
//            do {
//                let players = try JSONDecoder().decode(PlayersResponse.self, from: data)
//                DispatchQueue.main.async {
//                    self.players = players.data
//                }
//            } catch let error {
//                print(error.localizedDescription)
//            }
//            
//        }.resume()
    }
}
