//
//  MoviesViewController.swift
//  movs
//
//  Created by Matheus Silveira Venturini on 25/09/22.
//

import UIKit

class MoviesViewController: UIViewController {
    
    
    var stackView = UIStackView()
    
    var apiKey: String? {
        return Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigation()
        self.setupTabBar()
        self.setupMainScreen()
        
        
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        
        view.addSubview(stackView)
        
        
        
        
        Task {
            
            do {
                
                let teste = try await MoviesViewController.fetchPopularMovies(key: apiKey!)
                //print(teste[0])
                //updateCollectionViewSnapshot(albums)
                
                for i in 0...(teste.count - 1) {
                    let movieTitle = UILabel()
                    movieTitle.translatesAutoresizingMaskIntoConstraints = false
                    movieTitle.text = teste[i].title
                    movieTitle.font = UIFont.systemFont(ofSize: 24, weight: .medium)
                    movieTitle.textColor = UIColor(named: "FontColor")
                    movieTitle.textAlignment = .center
                    stackView.addArrangedSubview(movieTitle)

                }
                
            } catch {
                print("Request failed with error: \(error)")
            }
            
        }
                
        
    }
    
    
    static func fetchPopularMovies(key: String) async throws -> [Movie] {
        
        var urlPath: String = "https://api.themoviedb.org/3/movie/popular?api_key=\(key)&language=en-US&page=1"

        guard let url = URL(string: urlPath) else { throw ServiceError.invalidURL }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let resp = try JSONDecoder().decode(Response.self, from: data)
        
        return resp.results
        
    }
    

}
