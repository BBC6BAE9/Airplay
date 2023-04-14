//
//  ViewController.swift
//  OldAppSwift
//
//  Created by henry on 2023/3/23.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        // 创建 MPVolumeView 对象
        let volumeView = MPVolumeView(frame: CGRect.zero)
        volumeView.center = self.view.center

        // 将 MPVolumeView 添加到当前视图控制器的视图层次结构中
        view.addSubview(volumeView)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 查找所有可用的屏幕
        let screens = UIScreen.screens

        // 找到外部屏幕
        var externalScreen: UIScreen?
        for screen in screens {
            if screen != UIScreen.main {
                externalScreen = screen
                break
            }
        }

        // 如果找到了外部屏幕，则将应用程序窗口设置为该屏幕
        if let externalScreen = externalScreen {
            let modes = externalScreen.availableModes
            if let selectedMode = modes.last {
                externalScreen.currentMode = selectedMode
            }
            let screenBounds = externalScreen.bounds
            let window = UIWindow(frame: screenBounds)
            window.screen = externalScreen
            window.isHidden = false
        }
    }
}

