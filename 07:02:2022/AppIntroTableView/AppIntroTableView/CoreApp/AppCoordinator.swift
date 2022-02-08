//
//  AppCoordinator.swift
//  AppIntroTableView
//
//  Created by Diego Rodriguez Casillas on 7/2/22.
//

import Foundation
import UIKit

protocol AppCoordinatorProtocol {
	func showInitialViewController(window: UIWindow)
}

final class AppCoordinator: AppCoordinatorProtocol {
	
	private var initialViewController = UIViewController()
	
	internal func showInitialViewController(window: UIWindow) {
		initialViewController = CarListCoordinador.navigation()
		window.rootViewController = initialViewController
		window.makeKeyAndVisible()
	}
}
