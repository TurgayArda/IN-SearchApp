//
//  MovieDetailBuilder.swift
//  SearchApp
//
//  Created by ArdaSisli on 4.06.2022.
//

import Foundation

final class MovieDetailBuilder {
    static func make(movie: Search) -> MovieDetailVC {
        let view = MovieDetailVC()
        view.viewModel = MovieDetailViewModel(view: view, movie: movie)
        return view
    }
}
