//
//  PlayerDetailsView.swift
//  Great Sports
//
//  Created by Thafer Shahin on 11/12/2023.
//

import SwiftUI

struct PlayerDetailsView: View {
    var body: some View {
        NavigationStack {
            HStack {
                Text("Player details goes here")
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack{
                        Text("Player Details").bold().foregroundStyle(.white)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.pink, for: .navigationBar).toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    PlayerDetailsView()
}
