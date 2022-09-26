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
        appearanceNavigationBar.backgroundColor = UIColor(named: "AccentColor")
        appearanceNavigationBar.titleTextAttributes = [                    .foregroundColor: UIColor(named: "FontColor")!]
        
        let appearanceTabBar = UITabBarAppearance()
        appearanceTabBar.configureWithOpaqueBackground()
        appearanceTabBar.backgroundColor =  UIColor(named: "AccentColor")
        

        // Customizing our navigation bar
        navigationController?.navigationBar.tintColor = UIColor(named: "FontColor")
        navigationController?.navigationBar.standardAppearance = appearanceNavigationBar
        navigationController?.navigationBar.scrollEdgeAppearance = appearanceNavigationBar

        tabBarController?.tabBar.tintColor = UIColor(named: "FontColor")
        tabBarController?.tabBar.standardAppearance = appearanceTabBar
        tabBarController?.tabBar.scrollEdgeAppearance = appearanceTabBar

        self.view.backgroundColor = UIColor(named: "Background")
        
    }


}

