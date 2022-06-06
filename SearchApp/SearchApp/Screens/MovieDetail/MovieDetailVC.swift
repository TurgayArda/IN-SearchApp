//
//  MovieDetailVC.swift
//  SearchApp
//
//  Created by ArdaSisli on 4.06.2022.
//

import UIKit

class MovieDetailVC: UIViewController {

    //MARK: - Views
    
    private var titleLabel:  UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 21)
        return label
    }()
    
    private var movieImage: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 10.0
        return image
    }()
    
    private var yearLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 21)
        return label
    }()
    
    private var imdbURLButton: UIButton = {
        let button = UIButton()
        button.setTitle(MovieDetailConstant.IMDBButton.titleIMDB.rawValue, for: .normal)
        button.setTitleColor(UIColor.red , for: .normal)
        return button
    }()
    
    //MARK: - Property
    
    private var url: String = ""
    
    var viewModel: MovieDetailViewModel?
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel?.load()
        configure()
        clickIMDBButton()
      
    }
    
    //MARK: - Private Func
    
    private func configure() {
        view.backgroundColor = .white
        view.addSubview(movieImage)
        view.addSubview(titleLabel)
        view.addSubview(yearLabel)
        view.addSubview(imdbURLButton)
        makeImage()
        makeTitle()
        makeYear()
        makeImdbButton()
       
    }
    
   private func clickIMDBButton(){
        imdbURLButton.addTarget(self, action: #selector(clickIMDBUrl), for: .touchUpInside)
    }
    
     @objc func clickIMDBUrl(){
        if let url = URL(string: "\(url)") {
             UIApplication.shared.open(url, options: [:])
         }
    }
}

//MARK: - MovieDetailViewControllerProtocol

extension MovieDetailVC: MovieDetailViewControllerProtocol {
    func handleOutPut(_ output: MovieListProviderOutPut) {
        switch output {
        case .select(let data):
            titleLabel.text = data.title
            yearLabel.text = "Vision Date: \(data.year)"
            url = MovieDetailConstant.MovieDetailIMDBUrl.pathhIMDB(id: data.imdbID)
            if let url =  URL(string: data.poster) {
                movieImage.af.setImage(withURL: url)
            }
        case .title(let title):
            self.title = title
        }
    }
}

//MARK: - Constraints

extension MovieDetailVC {
    func makeImage() {
        movieImage.snp.makeConstraints { make in
            make
                .top
                .equalTo(view.safeAreaLayoutGuide)
                .offset(40)
            make
                .centerX
                .equalTo(view.snp.centerX)
            make
                .width
                .equalTo(view.safeAreaLayoutGuide.snp.height)
                .multipliedBy(0.45)
                
            make
                .height
                .equalTo(view.safeAreaLayoutGuide.snp.height)
                .multipliedBy(0.54)
        }
    }
    
    func makeTitle() {
        titleLabel.snp.makeConstraints { make in
            make
                .top
                .equalTo(movieImage.snp.bottom)
                .offset(20)
            make
                .centerX
                .equalTo(view.snp.centerX)
        }
    }
    
    func makeYear() {
        yearLabel.snp.makeConstraints { make in
            make
                .top
                .equalTo(titleLabel.snp.bottom)
                .offset(20)
            make
                .centerX
                .equalTo(view.snp.centerX)
        }
    }
    
    func makeImdbButton() {
        imdbURLButton.snp.makeConstraints { make in
            make
                .top
                .equalTo(yearLabel.snp.bottom)
                .offset(20)
            make
                .centerX
                .equalTo(view.snp.centerX)
        }
    }
}

