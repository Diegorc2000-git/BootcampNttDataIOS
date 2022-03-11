//
//  AppCoordinator.swift
//  POCCambioDomicilio
//
//  Created by Diego Rodriguez Casillas on 9/3/22.
//

import Foundation
import UIKit

protocol AppCoordinatorProtocol {
	func showInitialApp(window: UIWindow)
}

class AppCoordinator: AppCoordinatorProtocol {
	
	private var initialVC = UIViewController()
	internal func showInitialApp(window: UIWindow) {
		initialVC = SplashAssembly().build()
		window.rootViewController = initialVC
		window.makeKeyAndVisible()
	}
	
	static let defaultHTTPHeader: [String: String] = {
		return ["Comment-Type": "aplication/json"]
	}()
	
}
