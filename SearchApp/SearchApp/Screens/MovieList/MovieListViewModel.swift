//
//  MovieListViewModel.swift
//  SearchApp
//
//  Created by ArdaSisli on 4.06.2022.
//

import Foundation

final class MovieViewModel {
    var delegate: MovieListViewModelOutPut?
    var service: ISearchMovieProtocol?
    
    init(service: ISearchMovieProtocol) {
        self.service = service
    }
}

extension MovieViewModel: MovieViewModelProtocol {
    func load(path: String) {
        service?.fetchAllData(path: path,
                              success: { [delegate] data in
            delegate?.handleOutPut(.showMovieList(data))
        }, fail: { [delegate] error in
            delegate?.handleOutPut(.showError(error))
        })
    }
}
