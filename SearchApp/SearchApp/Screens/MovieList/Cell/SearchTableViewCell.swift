//
//  SearchTableViewCell.swift
//  SearchApp
//
//  Created by ArdaSisli on 4.06.2022.
//

import UIKit
import SnapKit
import AlamofireImage

class SearchTableViewCell: UITableViewCell {

    private var movieImage: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 10.0
        return image
    }()
    
    private var movieTitle: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .purple
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    enum Identifier: String {
        case path = "Cell"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
       
    }
    
    private func configure() {
        addSubview(movieImage)
        addSubview(movieTitle)
        makeImage()
        makeTitle()
    }
        
    func saveModel(value: Search) {
        movieTitle.text = value.title
        
        if let url =  URL(string: value.poster) {
            movieImage.af.setImage(withURL: url)
        }
    }
}

extension SearchTableViewCell {
    private func makeImage() {
        movieImage.snp.makeConstraints { make in
            make
                .top
                .equalTo(contentView)
                .offset(0)
            make
                .left
                .equalTo(contentView)
                .offset(10)
            make
                .width
                .equalTo(contentView.safeAreaLayoutGuide.snp.width)
                .multipliedBy(0.42)
                
            make
                .height
                .equalTo(contentView.safeAreaLayoutGuide.snp.width)
                .multipliedBy(0.39)
        }
    }
    
    private func makeTitle() {
        movieTitle.snp.makeConstraints { make in
            make
                .top
                .equalTo(contentView)
                .offset(10)
            make
                .left
                .equalTo(movieImage.snp.right)
                .offset(contentView.frame.height / 2)
            make
                .right
                .equalTo(contentView)
                .offset(-5)
        }
    }
}


