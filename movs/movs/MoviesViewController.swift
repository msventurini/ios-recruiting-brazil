//
//  MoviesViewController.swift
//  movs
//
//  Created by Matheus Silveira Venturini on 25/09/22.
//

import UIKit

class MoviesViewController: UIViewController {
    
    
    var stackView = UIStackView()
    //var movieTitle = UILabel()
    
//    struct Response: Codable {
//        let page: Int
//    }
    
    struct Movie: Decodable {
        var poster_path: String
        var overview: String
        var release_date: String
        var id: Int
        var title: String
        //var popularity: Int
    }
    
    struct Response: Decodable {
        var page: Int
        var results = [Movie]()
    }
    
    enum ServiceError: Error {
        case invalidURL
        case network(Error?)
        case decodeFail(Error)
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
        
        for _ in 0...30 {
            let movieTitle = UILabel()
            movieTitle.translatesAutoresizingMaskIntoConstraints = false
            movieTitle.text = "Movie tittle placeholder"
            movieTitle.font = UIFont.systemFont(ofSize: 24, weight: .medium)
            movieTitle.textColor = UIColor(named: "FontColor")
            movieTitle.textAlignment = .center
            
            stackView.addArrangedSubview(movieTitle)
            
        }
        
        
        Task {
            
            do {
                
                let teste = try await MoviesViewController.fetchPopularMovies()
                print(teste[0])
                //updateCollectionViewSnapshot(albums)

                
            } catch {
                print("Request failed with error: \(error)")
            }
            
        }

        
        
    }
    
    
    static func fetchPopularMovies() async throws -> [Movie] {
        
        guard let url = URL(string: "") else { throw ServiceError.invalidURL }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let resp = try JSONDecoder().decode(Response.self, from: data)
        
        return resp.results
        
    }
    

}
