//
//  URL+Extension.swift
//  MoviesApp
//
//  Created by Hina on 2024/04/29.
//  Copyright © 2024 Mohammad Azam. All rights reserved.
//

import Foundation
//URLの?sが?qに変更されたとき、ここだけ変更すれば良いだけになる
extension URL {
    static func forMoviesByName(_ name: String) -> URL? {
        return URL(string: "https://www.omdbapi.com/?s=\(name)&apikey=\(Constants.API_KEY)")
    }

}
