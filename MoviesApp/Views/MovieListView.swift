//
//  MovieListView.swift
//  MoviesApp
//
//  Created by Hina on 2024/04/29.
//  Copyright © 2024 Mohammad Azam. All rights reserved.
//

import SwiftUI
// すべての映画を表示する役割を担います
struct MovieListView: View {
    //映画を映画リストビューに渡す必要があります。
//moviesは moviesと同じで、ムービービューモデルの種類になります。
    let movies: [Movie]

    var body: some View {
        List(self.movies, id: \.imdbId) { movie in
            NavigationLink(destination: MovieDetailScreen(imdbId: movie.imdbId)) {
                MovieCell(movie: movie)
            }
        }
    }
}
