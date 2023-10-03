//
//  ContentView.swift
//  RickyAndMortyApp
//
//  Created by Michelli Cristina de Paulo Lima on 23/09/23.
//

import SwiftUI

struct HomeView: View {

    @StateObject var vm  = RickAndMortyViewModel()

    let accentColor = Color("AccentColor")

    var body: some View {
        VStack {
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    logoView
                    logoTextView
                    descriptionView

                    darkAndLightModeButtons

                    attentionLabel
                }
                favoriteList
                    .padding()
            }
            Divider()
                .background(Color.accentColor)
                .offset(y: -26)
            Spacer()
            VStack(alignment: .leading) {
                Text("Personagens")
                    .bold()
                switch vm.charactersState {
                case .initial:
                    ProgressView()
                case .loading:
                    ProgressView()
                case .error(let error):
                    Text("Algo deu errado, erro: \(error)")
                case .loaded(let data):
                    charactersList(characters: data)
                }
                Text("Episódios")
                    .bold()
                switch vm.episodeState {
                case .initial:
                    ProgressView()
                case .loading:
                    ProgressView()
                case .error(let error):
                    Text("Algo deu errado, erro: \(error)")
                case .loaded(let episodes):
                    episodesList(episodes: episodes)
                }
                Text("Localizações")
                    .bold()
                switch vm.locationState {
                case .initial:
                    ProgressView()
                case .loading:
                    ProgressView()
                case .error(let error):
                    Text("Algo deu errado, erro: \(error)")
                case .loaded(let locations):
                    locationsList(locations: locations)
                }
            }
            .padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


extension HomeView {

    private var logoView: some View {
        Image("LogoA")
            .frame(width: 219.57, height: 64)

    }

    private var logoTextView: some View {
        Text("Saiba tudo em\num só \(Text("lugar.").foregroundColor(.accentColor))")
            .fontWeight(.bold)
            .font(.largeTitle)
            .padding(.bottom)
    }

    private var descriptionView: some View {
        Text("Personagens, localizações, episódios e muito mais")
            .font(.subheadline)
    }

    private var darkAndLightModeButtons: some View {
        HStack {
            Button {

            } label: {
                Image(systemName: "moon")
                    .foregroundColor(.black)
                Text("Escuro")
                    .foregroundColor(.black)
            }
            .padding()

            Button {

            } label: {
                Image(systemName: "sun.max")
                    .foregroundColor(.black)
                Text("Claro")
                    .foregroundColor(.black)
            }
        }
    }

    private var attentionLabel: some View {
        Text("Wubba Lubba Dub Dub! Cuidado com os olhos.")
            .font(.subheadline)
            .foregroundColor(Color.accentColor)
    }

    private var favoriteList: some View {
        VStack(alignment: .trailing) {
            Button {

            } label: {
                Image(systemName: "heart")
                    .padding()
                Text("Lista de favoritos")
                    .frame(height: 32)
                    .padding(.horizontal)
            }
            .foregroundColor(.white)
            .background(Color.accentColor)
            .cornerRadius(20)
            .padding()

            Image("HighLightImage")
                .resizable()
                .frame(width: 250, height: 251)
                .scaledToFill()
        }
    }

    func charactersList(characters: Characters) -> some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(characters.results) { results in
                    VStack(alignment: .leading) {
                        AsyncImage(url: URL(string: results.image)) { image in
                            image.image?.resizable()
                                .cornerRadius(10)
                        }
                        .frame(width: 262, height: 200)
                        HStack {
                            Text(results.name)
                                .bold()
                            Spacer()
                            Button {

                            } label: {
                                Image(systemName: "heart")
                            }
                        }
                        HStack {
                            Image("Pulse")
                            Text(results.status)
                        }
                        HStack {
                            Image("species-photo")
                            Text(results.species)
                        }
                        HStack {
                            Image("planet")
                            Text(results.origin.name)
                        }
                        HStack {
                            Spacer()
                            Button {

                            } label: {
                                Image(systemName: "info.circle")
                                    .foregroundColor(Color.black)
                                Text("Saiba mais")
                                    .padding(2)
                                    .foregroundColor(Color.black)
                            }
                        }
                    }
                    .padding()
                    .background(Color(red: 249/255, green: 249/255, blue: 249/255))
                    .cornerRadius(10)
                }
            }
        }
    }

    func episodesList(episodes: Episodes) -> some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(episodes.results) { result in
                    HStack {
                        VStack(alignment: .leading) {
                            HStack {
                                Image("MonitorPlay")
                                Text("\(result.name) | \(result.episode)")
                            }
                            HStack {
                                Button {

                                } label: {
                                    Image(systemName: "info.circle")
                                        .foregroundColor(Color.black)
                                    Text("Saiba mais")
                                        .padding(2)
                                        .foregroundColor(Color.black)
                                }
                                Spacer()
                                Button {

                                } label: {
                                    Image(systemName: "heart")
                                }
                                .padding(2)
                            }
                        }
                    }
                    .padding()
                    .background(Color(red: 249/255, green: 249/255, blue: 249/255))
                    .cornerRadius(10)
                }
            }
        }
    }
    func locationsList(locations: Locations) -> some View {
        ScrollView(.horizontal) {
                    HStack {
                        ForEach(locations.results) { result in
                            VStack {
                                Image("planet")
                                Text(result.type)
                                Text(result.name)
                                    .foregroundColor(accentColor)
                                Button {

                                } label: {
                                    Image(systemName: "info.circle")
                                        .foregroundColor(Color.black)
                                    Text("Saiba mais")
                                        .foregroundColor(Color.black)
                                }
                                .padding(2)
                                Button {

                                } label: {
                                    Image(systemName: "heart")
                                }
                                .padding(2)
                            }
                            .padding()
                            .background(Color(red: 249/255, green: 249/255, blue: 249/255))
                            .cornerRadius(10)
                }
            }
        }
    }
}
