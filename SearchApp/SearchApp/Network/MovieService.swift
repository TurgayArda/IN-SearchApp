//
//  MovieService.swift
//  SearchApp
//
//  Created by ArdaSisli on 4.06.2022.
//

import Foundation
import Alamofire

public protocol ISearchMovieProtocol {
    func fetchAllData(path: String,
                      success: @escaping ([Search]) -> Void,
                      fail: @escaping (String) -> Void
    )
}

public class SearchMovieProtocol: ISearchMovieProtocol {
    public func fetchAllData(path: String,
                             success: @escaping ([Search]) -> Void,
                             fail: @escaping (String) -> Void
    ) {
        AF.request(SearchListNetwork.searchListPath(path: path), method: .get).responseDecodable(of: Movie.self) { (movie) in
            guard let data = movie.value else {
                return fail("Search result failed")
            }
         let value = data.search
         success(value)
        }
    }
}
