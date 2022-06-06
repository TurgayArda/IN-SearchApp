//
//  MovieListContracts.swift
//  SearchApp
//
//  Created by ArdaSisli on 4.06.2022.
//

import Foundation

//MARK: - ViewModel
protocol MovieViewModelProtocol {
    var delegate: MovieListViewModelOutPut? { get set }
    func load(path: String)
}

enum MovieViewModelOutPut {
    case showMovieList([Search])
    case showError(String)
}

protocol MovieListViewModelOutPut {
    func handleOutPut(_ output: MovieViewModelOutPut)
}

//MARK: - Provider
protocol MovieListProviderProtocol {
    var delegate: MovieListProviderDelegate? { get set }
    func load(value: [Search])
}

enum MovieListProviderOutPut {
    case select(Search)
    case title(String)
}

protocol MovieListProviderDelegate {
    func selected(at select: Search)
}
