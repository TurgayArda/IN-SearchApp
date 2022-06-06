//
//  ServiceConstant.swift
//  SearchApp
//
//  Created by ArdaSisli on 4.06.2022.
//

import Foundation

enum SearchListNetwork: String {
    case path_url = "http://www.omdbapi.com/"
    case key_url = "?apikey=f0ac39d3&s="
    case type_url = "&type=movie"
   
    
    static func searchListPath(path: String) -> String {
        return "\(path_url.rawValue)\(key_url.rawValue)\(path)\(type_url.rawValue)"
    }
}
