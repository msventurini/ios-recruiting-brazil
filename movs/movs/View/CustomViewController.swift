//
//  CustomViewController.swift
//  movs
//
//  Created by Matheus Silveira Venturini on 16/10/22.
//

import UIKit

class CustomViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigation()
        self.setupTabBar()
        self.setupMainScreen()
 
        // Do any additional setup after loading the view.
    }
    
    func setupNavigation() {
        //TODO: USAR SWIFTGEN PARA COLORIZAR
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

extension UINavigationController {
    convenience init(viewController: UIViewController, title: String, icon: UIImage){
        self.init(rootViewController: viewController)
        self.title = title
        self.tabBarItem.image = icon
    }
}
