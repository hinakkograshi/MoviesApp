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
    init() {
        self.movieListVM = MovieListViewModel()
        self.movieListVM.searchByName("batman")
    }
    var body: some View {
        NavigationStack {
            VStack {
                MovieListView(movies: self.movieListVM.movies)
                    .navigationTitle("Movies")
            }
        }
    }
}

#Preview {
    MovieListScreen()
}
