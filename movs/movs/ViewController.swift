//
//  ViewController.swift
//  movs
//
//  Created by Matheus Silveira Venturini on 25/09/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Defining our screen title

        let appearanceNavigationBar = UINavigationBarAppearance()
        appearanceNavigationBar.configureWithOpaqueBackground()
        appearanceNavigationBar.backgroundColor = .red
        appearanceNavigationBar.titleTextAttributes = [.font: UIFont.boldSystemFont(ofSize: 20.0),
                                          .foregroundColor: UIColor.white]
        
        let appearanceTabBar = UITabBarAppearance()
        appearanceTabBar.configureWithOpaqueBackground()
        appearanceTabBar.backgroundColor = .red
        

        // Customizing our navigation bar
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearanceNavigationBar
        navigationController?.navigationBar.scrollEdgeAppearance = appearanceNavigationBar

        tabBarController?.tabBar.tintColor = .white
        tabBarController?.tabBar.standardAppearance = appearanceTabBar
        tabBarController?.tabBar.scrollEdgeAppearance = appearanceTabBar

    }


}

