//
//  PlayersView.swift
//  Great Sports
//
//  Created by Thafer Shahin on 11/12/2023.
//

import SwiftUI

struct PlayersView: View {
    @StateObject var viewModel = PlayersViewModel()
    @State var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Spacer(minLength: 20)
                    HStack {
                        Text("Top Players").font(.largeTitle).foregroundStyle(.pink).padding([.leading], 15)
                        Spacer()
                    }.frame(height: 40)
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(viewModel.players) { player in
                                Spacer(minLength: 10)
                                VStack(alignment: .leading, spacing: 10) {
                                    ZStack {
                                        AsyncImage(
                                            url: URL(string: player.photo),
                                            content: { image in
                                                image.resizable().aspectRatio(contentMode: .fit)
                                            }, placeholder: {
                                                Color.white
                                            })
                                    }
                                    .frame(width: 136, height: 136)
                                    .fixedSize()
                                    Text(player.name).lineLimit(1).font(.subheadline).padding([.leading], 10)
                                    Text(player.teamName).foregroundStyle(.pink).lineLimit(1).padding([.leading], 10)
                                }
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .frame(width: 136, height: 215)
                                .shadow(radius: 7)
                                Spacer(minLength: 10)
                            }
                        }
                    }
                    .frame(height: 230)
                    
                    HStack {
                        Text("All Players").font(.largeTitle).foregroundStyle(.pink).padding([.leading], 15)
                        Spacer()
                    }.frame(height: 40)
                    
                    ForEach(viewModel.players) { player in
                        Spacer(minLength: 10)
                        HStack (alignment: .top, spacing: 0) {
                            ZStack {
                                AsyncImage(
                                    url: URL(string: player.photo),
                                    content: { image in
                                        image.resizable().aspectRatio(contentMode: .fit)
                                    }, placeholder: {
                                        Color.white
                                    })
                                .frame(width: 48, height: 48)
                                .padding(5)
                            }
                            
                            VStack (alignment: .leading) {
                                Text(player.name).lineLimit(1).font(.title3).padding([.leading], 10)
                                HStack {
                                    Text(player.teamName).foregroundStyle(.pink).lineLimit(1).padding([.leading], 10)
                                    Text(" | " + player.positionName).foregroundStyle(.gray)
                                }
                                
                            }
                            .frame(width: 250, height: 60, alignment: .leading)
                            VStack (alignment: .center) {
                                Text(player.rating).foregroundStyle(.pink)
                                Text("Rating").font(.caption).foregroundStyle(.gray)
                            }
                            .frame(width: 50)
                            .padding([.top], 10)
                            .padding([.trailing], 5)
                        }
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .frame(width: 336, height: 70)
                        .shadow(radius: 5)
                        
                    }
                    
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack{
                        Text("Players").bold().foregroundStyle(.white)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.pink, for: .navigationBar).toolbarBackground(.visible, for: .navigationBar)
            
        }.onAppear {
            viewModel.fetchPlayers()
        }
    }
}

#Preview {
    PlayersView()
}
