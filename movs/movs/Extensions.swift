//
//  ViewController.swift
//  movs
//
//  Created by Matheus Silveira Venturini on 25/09/22.
//

import UIKit

extension UINavigationController {
    convenience init(viewController: UIViewController, title: String, icon: UIImage){
        self.init(rootViewController: viewController)
        self.title = title
        self.tabBarItem.image = icon
    }
}

extension UIViewController {
    func setupNavigation() {

        let appearanceNavigationBar = UINavigationBarAppearance()
        appearanceNavigationBar.configureWithOpaqueBackground()
        appearanceNavigationBar.backgroundColor = UIColor(named: "AccentColor")
        appearanceNavigationBar.titleTextAttributes = [
            .foregroundColor: UIColor(named: "FontColor")!]
        
        // Customizing our navigation bar
        navigationController?.navigationBar.tintColor = UIColor(named: "FontColor")
        navigationController?.navigationBar.standardAppearance = appearanceNavigationBar
        navigationController?.navigationBar.scrollEdgeAppearance = appearanceNavigationBar
    }
    
    func setupTabBar() {
        
        let appearanceTabBar = UITabBarAppearance()
        appearanceTabBar.configureWithOpaqueBackground()
        appearanceTabBar.backgroundColor =  UIColor(named: "AccentColor")
        
        tabBarController?.tabBar.tintColor = UIColor(named: "FontColor")
        tabBarController?.tabBar.standardAppearance = appearanceTabBar
        tabBarController?.tabBar.scrollEdgeAppearance = appearanceTabBar
        
    }
    
    func setupMainScreen() {
        self.view.backgroundColor = UIColor(named: "Background")
        self.title = "Movies"
    }
    
}

