//
//  SceneDelegate.swift
//  myMoviesApplication
//
//  Created by Mariam Joglidze on 22.02.23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var visualEffectView = UIVisualEffectView()




    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
//        guard let windowScene = (scene as? UIWindowScene) else { return }
//
//        // Create a new window
//        let window = UIWindow(windowScene: windowScene)
//        window.frame = windowScene.coordinateSpace.bounds
//
//        // Add a blur effect to the window's content view
//        let blurEffect = UIBlurEffect(style: .regular)
//        let blurView = UIVisualEffectView(effect: blurEffect)
//        blurView.frame = window.bounds
//        window.addSubview(blurView)
//
//        let vc = UIStoryboard(name: "MainTabBarViewController", bundle: nil).instantiateViewController(withIdentifier: "MainTabBarViewController")
//        window.rootViewController = vc
//
//        // Set the window as the scene's window
//        self.window = window
//        window.makeKeyAndVisible()
//
        
        
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        window?.makeKeyAndVisible()
        let vc = UIStoryboard(name: "MainTabBarViewController", bundle: nil).instantiateViewController(withIdentifier: "MainTabBarViewController")
        window?.rootViewController = vc
        

        
        

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
        self.visualEffectView.removeFromSuperview()


    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        if !self.visualEffectView.isDescendant(of: self.window!) {
            let blurEffect = UIBlurEffect(style: .light)
            self.visualEffectView = UIVisualEffectView(effect: blurEffect)
            self.visualEffectView.frame = (self.window?.bounds)!
            self.window?.addSubview(self.visualEffectView)
           }
       

        
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
        self.visualEffectView.removeFromSuperview()

        
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

