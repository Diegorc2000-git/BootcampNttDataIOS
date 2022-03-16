//
//  AppDelegate.swift
//  POCCambioDomicilio
//
//  Created by Diego Rodriguez Casillas on 9/3/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	let appCoordinator: AppCoordinatorProtocol = AppCoordinator()

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		window = UIWindow(frame: UIScreen.main.bounds)
		if let windowDes = window {
			appCoordinator.showInitialApp(window: windowDes)
		}
		return true
	}

}