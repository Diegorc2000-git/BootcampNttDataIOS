//
//  AppCoordinator.swift
//  AppUserDefaultIntro
//
//  Created by Diego Rodriguez Casillas on 11/2/22.
//

import Foundation
import UIKit

protocol AppCoordinatorProtocol {
	func showInitialViewController(window: UIWindow)
}

final class AppCoordinator: AppCoordinatorProtocol {
	
	private var initialViewController = UIViewController()
	
	internal func showInitialViewController(window: UIWindow) {
		self.initialViewController = UserDefaultViewCoordinator.navigation()
		window.rootViewController = self.initialViewController
		window.makeKeyAndVisible()
	}
	
	
}
