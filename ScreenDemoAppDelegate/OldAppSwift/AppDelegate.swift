//
//  AppDelegate.swift
//  OldAppSwift
//
//  Created by henry on 2023/3/23.
//

import UIKit
import AVKit
import AVFoundation
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    var window: UIWindow?
    var externalWindow: UIWindow?
    var airplayController: AVPlayerViewController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window?.backgroundColor = UIColor.white;
        window = UIWindow(frame: UIScreen.main.bounds);
        
        let vc = ViewController();
        window?.rootViewController = vc;
        window?.makeKeyAndVisible()
        
        // 添加AirPlay连接状态监听器
        NotificationCenter.default.addObserver(self, selector: #selector(airplayConnectionChanged), name: AVAudioSession.routeChangeNotification, object: nil)
        
        return true
    }
    
    // AirPlay连接状态变化处理
    @objc func airplayConnectionChanged(notification: Notification) {
        let session = AVAudioSession.sharedInstance()
        guard let userInfo = notification.userInfo,
              let reasonValue = userInfo[AVAudioSessionRouteChangeReasonKey] as? UInt,
              let reason = AVAudioSession.RouteChangeReason(rawValue: reasonValue) else {
            return
        }
        
        switch reason {
        case .newDeviceAvailable:
            
            if #available(iOS 16.0, *) {
                let openSessions = UIApplication.shared.openSessions
                for session in openSessions {
                    print(session.role)
//                    if let scene = session.scene, let screen = scene.screen, screen != UIScreen.main {
//                        // 这是来自其他屏幕的场景
//                        // 可以执行相关操作，例如设置外部屏幕的rootViewController等等
//                    }
                }
            } else {
                // 在iOS 16.0之前的版本中，可以使用UIScreen.screens来查找屏幕
                let externalScreens = UIScreen.screens.filter({ $0 != UIScreen.main })
                for screen in externalScreens {
                    // 可以执行相关操作，例如设置外部屏幕的rootViewController等等
                }
            }
            
            
            
            // AirPlay连接到一个外部显示器
            if let externalScreen = UIScreen.screens.first(where: { $0 != UIScreen.main }) {
                
            
                let window = UIWindow(frame: externalScreen.bounds)
                self.externalWindow = window
                window.rootViewController = ContentViewController()
                window.isHidden = false
                window.screen = externalScreen
                window.makeKeyAndVisible()
                
                let windows = UIApplication.shared.windows

//                // 创建一个与该屏幕关联的新UIWindow对象
//                CGRect screenBounds = externalScreen.bounds;
//                UIWindow *newWindow = [[UIWindow alloc] initWithScreenMode:externalScreen.currentMode];
//                newWindow.frame = screenBounds;
//                newWindow.backgroundColor = [UIColor clearColor];
//                newWindow.windowLevel = UIWindowLevelNormal;
//
//                // 创建并配置UILabel
//                UILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
//                myLabel.text = @"Hello World";
//                myLabel.textAlignment = NSTextAlignmentCenter;
//
//                // 获取UIWindow的根视图控制器
//                UIViewController *rootViewController = [[UIViewController alloc] init];
//                rootViewController.view.backgroundColor = [UIColor clearColor];
//                rootViewController.view.frame = screenBounds;
//
//                // 将UILabel添加到根视图控制器的视图层次结构中
//                [rootViewController.view addSubview:myLabel];
//
//                // 将视图控制器的视图添加到新的UIWindow对象中
//                newWindow.rootViewController = rootViewController;
//
//                // 显示新的UIWindow对象
//                [newWindow makeKeyAndVisible];
                
                
//                // 将你的UIView添加到外部显示器上
//                let externalWindow = UIWindow(frame: externalScreen.bounds)
////                externalWindow.screen = externalScreen
//                externalWindow.isHidden = false
//                let contentVC = ContentViewController()
//                externalWindow.rootViewController = contentVC
//                externalWindow.screen = externalScreen
////                externalWindow.rootViewController?.view.addSubview(contentVC.view)
//                contentVC.view.frame = externalWindow.bounds
//

//                externalScreen.rootViewController = contentVC;
            }
        case .oldDeviceUnavailable:
            // AirPlay从外部显示器断开连接
            self.airplayController?.player?.pause()
            self.airplayController?.view.removeFromSuperview()
            self.airplayController = nil
            
            // 恢复其他设备上的音频
            do {
                try session.setActive(false, options: .notifyOthersOnDeactivation)
            } catch {
                print("Failed to deactivate audio session. Error: \(error.localizedDescription)")
            }
            
        default:
            break
        }
    }
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([Any]?) -> Void) -> Bool {
        if userActivity.activityType == NSUserActivityTypeBrowsingWeb {
            if let url = userActivity.webpageURL {
                // 在这里处理打开 URL 的逻辑
            }
            return true
        }
        return false
    }
}

