//
//  ViewModel.swift
//  MoviesApp
//
//  Created by Hina on 2024/04/29.
//  Copyright © 2024 Mohammad Azam. All rights reserved.
//

import Foundation

enum LoadingState {
    case loading
    case success
    case failed
    case none
}
class ViewModel: ObservableObject {
    @Published var loadingState: LoadingState = .none
}
