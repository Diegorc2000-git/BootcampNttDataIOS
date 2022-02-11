//
//  AppDelegate.swift
//  AppPart4
//
//  Created by Diego Rodriguez Casillas on 9/2/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	let appCoordinator: AppCoordinator = AppCoordinator()
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		window = UIWindow(frame: UIScreen.main.bounds)
		if let windowDes = window {
			appCoordinator.showInitialViewController(window: windowDes)
		}
		
		return true
	}

}

