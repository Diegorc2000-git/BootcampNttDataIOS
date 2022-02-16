//
//  AppCoordinator.swift
//  NttdataTask
//
//  Created by Diego Rodriguez Casillas on 16/2/22.
//

import Foundation
import UIKit

protocol AppCoordinatorProtocol {
	func initialViewController(window: UIWindow)
}

final class AppCoordinator: AppCoordinatorProtocol {
	
	private var initialVC = UIViewController()
	
	internal func initialViewController(window: UIWindow) {
		self.initialVC = TabBarHomeCoordinator.view()
		window.rootViewController = self.initialVC
		window.makeKeyAndVisible()
	}
}
