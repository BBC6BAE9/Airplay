![screen](./screeen.png)
# Screen Demo

There are two demos in the project, each using either `AppDelegate` or `SceneDelegate` (recommended) to manage the app's windows. The goal is to use UIKit to display custom content on a TV through AirPlay.

pay attension to info.plist setting if you choose SceneDelegate
```Swift
<key>UISceneConfigurations</key>
		<dict>
			<key>UIWindowSceneSessionRoleApplication</key>
			<array>
				<dict>
					<key>UISceneConfigurationName</key>
					<string>Default Configuration</string>
					<key>UISceneDelegateClassName</key>
					<string>$(PRODUCT_MODULE_NAME).SceneDelegate</string>
					<key>UISceneStoryboardFile</key>
					<string>Main</string>
				</dict>
			</array>
			<key>UIWindowSceneSessionRoleExternalDisplayNonInteractive</key>
			<array>
				<dict>
					<key>UISceneConfigurationName</key>
					<string>Default Configuration</string>
					<key>UISceneDelegateClassName</key>
					<string>$(PRODUCT_MODULE_NAME).TVSceneDelegate</string>
				</dict>
			</array>
		</dict>
```

