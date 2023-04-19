//
//  AppDelegate.swift
//  ScreenDemo
//
//  Created by ihenry on 2023/4/14.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if #available(iOS 10.3, *) {
               NotificationCenter.default.addObserver(self, selector: #selector(handleReviewRequest(_:)), name: Notification.Name(rawValue: "com.apple.storereviewcontroller.didfinish"), object: nil)
           }
        
        return true
    }

    @objc func handleReviewRequest(_ notification: Notification) {
        if let userInfo = notification.userInfo,
            let resultString = userInfo["result"] as? String,
            let result = Int(resultString) {
            switch result {
            case 0:
                print("用户取消了评分")
                // 在此处添加取消评分后需要执行的代码
            case 1:
                print("用户完成了评分")
                // 在此处添加完成评分后需要执行的代码
            default:
                break
            }
        }
    }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

