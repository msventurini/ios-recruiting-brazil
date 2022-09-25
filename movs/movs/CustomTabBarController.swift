//
//  CustomTabBarController.swift
//  movs
//
//  Created by Matheus Silveira Venturini on 25/09/22.
//

import UIKit

class CustomTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navMovies = generateNavController(vc: MoviesViewController(), title: "Movies")
        let navFavorites = generateNavController(vc: FavoritesViewController(), title: "Favorites")

        UINavigationBar.appearance().prefersLargeTitles = true
        
        viewControllers = [navMovies, navFavorites]
        
    }
    
    fileprivate func generateNavController(vc: UIViewController, title: String) -> UINavigationController {
        let navController = UINavigationController(rootViewController: vc)
        navController.title = title
        return navController
    }
    
}
