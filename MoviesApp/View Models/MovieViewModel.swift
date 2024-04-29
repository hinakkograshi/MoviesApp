//
//  MovieViewModel.swift
//  MoviesApp
//
//  Created by Hina on 2024/04/29.
//  Copyright © 2024 Mohammad Azam. All rights reserved.
//

import Foundation
import SwiftUI
// 構造体だったら名前検索がmutating functionになる
// ObservableObjectはclassのみ
class MovieListViewModel: ObservableObject {
// ビューは、Httpクライアントを使用してURLからデータを取得したことを認識せず、
    // ビューを再レンダリングする必要があります。Published
    @Published var movies = [Movie]()
    let httpClient = HTTPClient()

    func searchByName(_ name: String) {
        httpClient.getMoviesBy(search: name) { result in
            switch result {
            case .success(let movies):
                guard let movies = movies else { return }
                    DispatchQueue.main.async {
                        // movies(Model)からmovies(ViewModel)に渡す！
// 最終的には、結果をセルフドットムービーに割り当て、ビューに再描画するように伝える
                        // ⭐️Viewに再描画通知
                        self.movies = movies
                    }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
// ムービーモデルには、ビューに公開したくないプロパティがたくさんあるかもしれません。
//struct MovieViewModel {
//
//    let movie: Movie
//
//    var imdbId: String {
//        movie.imdbId
//    }
//
//    var title: String {
//        movie.title
//    }
//
//    var poster: String {
//        movie.poster
//    }
//
//    var year: String {
//        movie.year
//    }
//}
