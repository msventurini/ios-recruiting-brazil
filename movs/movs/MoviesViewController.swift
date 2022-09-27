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
        
        
    }

}
