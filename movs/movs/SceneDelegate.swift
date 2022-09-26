//
//  SceneDelegate.swift
//  movs
//
//  Created by Matheus Silveira Venturini on 25/09/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }

        //código pego na internet para manter o comportamento antigo da navigation bar pré-iOS 15
        if #available(iOS 15.0, *) {
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithDefaultBackground()
            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().compactAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        //window = UIWindow()
        //window?.makeKeyAndVisible()
        window?.windowScene = windowScene
        //window?.rootViewController = ViewController()
        window?.rootViewController = createTabBar()
        window?.makeKeyAndVisible()
        
    }

    func createMoviesNavigationController() -> UINavigationController {
        let moviesViewController = MoviesViewController()
        moviesViewController.title = "Movies"
        moviesViewController.tabBarItem.image = UIImage(named: "list_icon")
        return UINavigationController(rootViewController: moviesViewController)
    }

    func createFavoritesNavigationController() -> UINavigationController {
        let favoritesViewController = FavoritesViewController()
        favoritesViewController.title = "Favorites"
        favoritesViewController.tabBarItem.image = UIImage(named: "favorite_empty_icon")
        return UINavigationController(rootViewController: favoritesViewController)
    }
    
    func createTabBar() -> UITabBarController {
        let tabBar = UITabBarController()
        tabBar.viewControllers = [createMoviesNavigationController(), createFavoritesNavigationController()]
        
        
        //código pego na internet para manter o comportamento antigo da navigation tab bar pré-iOS 15

        if #available(iOS 13.0, *) {
            let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            //tabBarAppearance.backgroundColor = UIColor.tabBarBackground
            tabBarAppearance.selectionIndicatorTintColor = .systemGreen
            UITabBar.appearance().standardAppearance = tabBarAppearance

            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            }
            
        }
        
    
        return tabBar

    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

