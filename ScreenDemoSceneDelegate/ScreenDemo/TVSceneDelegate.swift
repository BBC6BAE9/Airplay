//
//  TVSceneDelegate.swift
//  ScreenDemo
//
//  Created by ihenry on 2023/4/14.
//

import UIKit


class TVSceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//        if (session.role == UIWindowSceneSessionRoleExternalDisplay) {
//            UIWindowScene *windowScene = (UIWindowScene *)scene;
//            DanmuController *danmuController = [[DanmuController alloc] init];
//            UIWindow *windows = [[UIWindow alloc] initWithWindowScene:windowScene];
//            windows.rootViewController = danmuController;
//            self.window = windows;
//            [windows makeKeyAndVisible];
            
        if (session.role == .windowExternalDisplay){
            let window = UIWindow(windowScene: scene as! UIWindowScene)
            self.window = window
            window.rootViewController = TVViewController()
            window.makeKeyAndVisible()
        }
        print("-----------")
        print("-----------")
        print("-----------")
    }
}
