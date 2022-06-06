//
//  MovieDetailContracts.swift
//  SearchApp
//
//  Created by ArdaSisli on 4.06.2022.
//

import Foundation

//MARK: - ViewModel
protocol MovieDetailProtocol {
    var view: MovieDetailViewControllerProtocol? { get set }
    func load()
}

//MARK: ViewController
protocol MovieDetailViewControllerProtocol {
    func handleOutPut(_ output: MovieListProviderOutPut)
}
