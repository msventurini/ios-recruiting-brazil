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
        
        MoviesFetcher.shared.getPopularMovies(for: apiKey!, page: 1) { (result) in
            
            switch result{
            case .success(let movies):
                print(movies)
            case .failure(let error):
                print(error)
            }
            
        }
        
        
        
    }
    


}
