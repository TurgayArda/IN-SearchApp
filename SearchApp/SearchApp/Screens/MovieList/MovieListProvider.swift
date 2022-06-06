//
//  MovieListProvider.swift
//  SearchApp
//
//  Created by ArdaSisli on 4.06.2022.
//

import UIKit

class MovieListProvider: NSObject {
    
    var delegate: MovieListProviderDelegate?
    var movieData: [Search] = []
}

extension MovieListProvider: MovieListProviderProtocol {
    func load(value: [Search]) {
        self.movieData = value
    }
    
    func remove() {
        movieData.removeAll()
    }
}

extension MovieListProvider: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movieData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.Identifier.path.rawValue) as? SearchTableViewCell else {
            return UITableViewCell()
        }
        cell.saveModel(value: movieData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let data = movieData[indexPath.row]
        delegate?.selected(at: data)
    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y: cell.contentView.frame.height)
//                UIView.animate(
//                    withDuration: 0.5,
//                    delay: 0.05 * Double(indexPath.row),
//                    options: [.curveLinear],
//                    animations: {
//                        cell.transform = CGAffineTransform(translationX: 0, y: 0)
//                })
//    }
}
