//
//  MovieDetailViewModel.swift
//  SearchApp
//
//  Created by ArdaSisli on 4.06.2022.
//

import Foundation

final class MovieDetailViewModel: MovieDetailProtocol {
    var view: MovieDetailViewControllerProtocol?
    var movie: Search?
    init(view: MovieDetailViewControllerProtocol, movie: Search) {
        self.movie = movie
        self.view = view
    }
    
    func load() {
        guard let movieDetail = movie else { return }
        view?.handleOutPut(.select(movieDetail))
        view?.handleOutPut(.title(movieDetail.title))
    }
}
