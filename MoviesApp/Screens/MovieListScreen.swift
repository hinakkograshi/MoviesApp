//
//  MovieListScreen.swift
//  MoviesApp
//
//  Created by Hina on 2024/04/29.
//  Copyright © 2024 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct MovieListScreen: View {
// 監視されている
    @ObservedObject private var movieListVM: MovieListViewModel
    @State var movieName = ""
    init() {
        self.movieListVM = MovieListViewModel()
    }
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Search", text: $movieName) {
                    movieListVM.searchByName(movieName)
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                Spacer()

                if self.movieListVM.loadingState == .success {
                    MovieListView(movies: self.movieListVM.movies)
                } else if self.movieListVM.loadingState == .failed {
                    FailedView()
                } else if self.movieListVM.loadingState == .loading {
                    LoadingView()
                }
            }
            .navigationTitle("Movies")
            .padding()
        }
    }
}

#Preview {
    MovieListScreen()
}
