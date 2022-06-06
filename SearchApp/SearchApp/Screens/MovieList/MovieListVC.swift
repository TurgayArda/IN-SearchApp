//
//  MovieListVC.swift
//  SearchApp
//
//  Created by ArdaSisli on 4.06.2022.
//

import UIKit

class MovieListVC: UIViewController {
    
    //MARK: - Views
    
    private var searchBar: UISearchController = {
        let search = UISearchController()
        search.searchBar.placeholder = MovieListConstant.MovieListSearch.placeHolder.rawValue
        search.searchBar.showsCancelButton = true
        return search
    }()

    private var movieTableView: UITableView = {
        let table = UITableView()
        table.rowHeight = 200
        table.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.Identifier.path.rawValue)
        return table
    }()
    
    private var indicator: UIActivityIndicatorView = {
        let ind = UIActivityIndicatorView()
        ind.color = .red
        return ind
    }()
    
    //MARK: - Property
    
    private var provider = MovieListProvider()
    private var isSearch = false
    private var errorMessage: String = ""
    
    var viewModel: MovieViewModelProtocol?
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        indicator.startAnimating()
        configure()
        initDelegate()
    }
    
    //MARK: - Private Func
    
    private func initDelegate() {
       
        movieTableView.delegate = provider
        movieTableView.dataSource = provider
        provider.delegate = self
        viewModel?.delegate = self
        searchBar.searchBar.delegate = self
    }
    
    private func configure() {
        view.backgroundColor = .white
        navigationItem.searchController = searchBar
        view.addSubview(indicator)
        view.addSubview(movieTableView)
        makeIndicator()
    }
    
    private func alert() {
        if isSearch {
            let errorAlert = UIAlertController(title: MovieListConstant.MovieListAlert.alertTitle.rawValue, message: self.errorMessage, preferredStyle: .alert)
            let errorAction = UIAlertAction(title: MovieListConstant.MovieListAlert.actionTitle.rawValue, style: .cancel)
            errorAlert.addAction(errorAction)
            self.present(errorAlert, animated: true)
        }
    }
}

//MARK: MovieListViewModelOutPut

extension MovieListVC: MovieListViewModelOutPut {
    func handleOutPut(_ output: MovieViewModelOutPut) {
        switch output {
        case .showMovieList(let array):
            provider.remove()
            provider.load(value: array)
           
        case .showError(let error):
            provider.load(value: [])
                errorMessage = error
                alert()
        }
        
        DispatchQueue.main.async {
            self.movieTableView.reloadData()
            self.makeTable()
        }
    }
}

//MARK: MovieListProviderDelegate

extension MovieListVC: MovieListProviderDelegate {
    func selected(at select: Search) {
        print(select)
        let viewController = MovieDetailBuilder.make(movie: select)
        self.show(viewController, sender: nil)
    }
}

//MARK: UISearchBarDelegate

extension MovieListVC: UISearchBarDelegate {
     func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
            viewModel?.load(path: text)
            indicator.stopAnimating()
            isSearch = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        provider.remove()
        searchBar.text?.removeAll()
        viewModel?.load(path: searchBar.text ?? "")
        movieTableView.isHidden = true
        indicator.startAnimating()
        isSearch = false
    
    DispatchQueue.main.async {
        self.movieTableView.reloadData()
        }
    }
}

//MARK: - Constraints

extension MovieListVC {
    private func makeIndicator() {
            indicator.snp.makeConstraints { make in
            make
                .centerX
                .equalTo(view.snp.centerX)
            make
                .centerY
                .equalTo(view.snp.centerY)
            }
    }
    private func makeTable() {
        movieTableView.snp.makeConstraints { make in
            make
                .top
                .equalTo(view.safeAreaLayoutGuide)
                .offset(5)
            make
                .left
                .right
                .equalTo(view)
                .offset(0)
            make
                .bottom
                .equalTo(view.safeAreaLayoutGuide)
                .offset(0)
        }
    }
}
