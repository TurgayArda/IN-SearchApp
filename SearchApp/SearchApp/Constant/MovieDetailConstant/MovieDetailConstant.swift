//
//  MovieDetailConstant.swift
//  SearchApp
//
//  Created by ArdaSisli on 4.06.2022.
//

import Foundation

final class MovieDetailConstant {
    enum MovieDetailIMDBUrl: String {
        case basic_url =  "https://www.imdb.com/title/"
        case path_url =  "/?ref_=nv_sr_srsg_0"
        
        static func pathhIMDB(id: String) -> String {
            return "\(basic_url.rawValue)\(id)\(path_url.rawValue)"
        }
    }
    
    enum IMDBButton: String {
        case titleIMDB = "IMDB"
    }
}
