//
//  AppDelegate.swift
//  AppIntroTableView
//
//  Created by Diego Rodriguez Casillas on 7/2/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	let appCoordinator: AppCoordinatorProtocol = AppCoordinator()
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		window = UIWindow(frame: UIScreen.main.bounds)
		if let window = window {
			appCoordinator.showInitialViewController(window: window)
		}
		return true
	}

}

