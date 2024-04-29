//
//  HTTPClient.swift
//  MoviesApp
//
//  Created by Hina on 2024/04/29.
//  Copyright © 2024 Mohammad Azam. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case noData
    case decodingError
}

class HTTPClient {

    func getMovieDetailsBy(imdbId: String, completion: @escaping (Result<MovieDetail, NetworkError>) -> Void) {

        guard let url = URL.forMoviesByImdbId(imdbId) else {
            return completion(.failure(.badURL))
        }

        URLSession.shared.dataTask(with: url) { data, response, error in

            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }

            guard let movieDetail = try? JSONDecoder().decode(MovieDetail.self, from: data) else {
                return completion(.failure(.decodingError))
            }

            completion(.success(movieDetail))

        }.resume()

    }
    func getMoviesBy(search: String, completion: @escaping (Result<[Movie]?, NetworkError>) -> Void) {
        guard let url = URL.forMoviesByName(search) else {
            return completion(.failure(.badURL))
        }

        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }

            guard let moviesResponse = try? JSONDecoder().decode(Movies.self, from: data) else {
                return completion(.failure(.decodingError))
            }
            completion(.success(moviesResponse.movies))
        }.resume()
    }
}
