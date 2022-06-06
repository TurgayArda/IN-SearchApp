//
//  MovieListBuilder.swift
//  SearchApp
//
//  Created by ArdaSisli on 4.06.2022.
//

import Foundation

final class MovieListBuilder {
   static func make() -> MovieListVC {
        let view = MovieListVC()
       view.viewModel = MovieViewModel(service: SearchMovieProtocol())
       return view
    }
}
