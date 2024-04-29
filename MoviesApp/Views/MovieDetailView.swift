//
//  MovieDetailView.swift
//  MoviesApp
//
//  Created by Hina on 2024/04/29.
//  Copyright © 2024 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct MovieDetailView: View {

    let movieDetailVM: MovieDetailViewModel

    var body: some View {
        ScrollView {

            VStack(alignment: .leading, spacing: 10) {
                URLImage(url: movieDetailVM.poster)
                    .cornerRadius(10)

                Text(movieDetailVM.title)
                    .font(.title)
                Text(movieDetailVM.plot)
                Text("Director").fontWeight(.bold)
                Text(movieDetailVM.director)
                HStack {
                    Rating(rating: .constant(movieDetailVM.rating))
                    Text("\(movieDetailVM.rating)/10")
                }.padding(.top, 10)

                Spacer()
            }.padding()

            .navigationBarTitle(self.movieDetailVM.title)
        }
    }
}
