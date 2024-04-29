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
            HStack(alignment: .top) {
                URLImage(url: movie.poster)
                    .frame(width: 100, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                VStack(alignment: .leading) {
                    Text(movie.title)
                        .font(.headline)
                    Text(movie.year)
                        .opacity(0.5)
                        .padding(.top, 10)
                }.padding(5)
                Spacer()
            }.contentShape(Rectangle())
        }
    }
}
