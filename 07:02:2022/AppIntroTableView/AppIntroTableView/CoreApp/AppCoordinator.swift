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
		self.customUI()
		initialViewController = HomeCoordinator.view()
		window.rootViewController = initialViewController
		window.makeKeyAndVisible()
	}
	
	private func customUI() {
		let navBar = UINavigationBar.appearance()
		let tabBar = UITabBar.appearance()

		navBar.backgroundColor = UIColor.black
		tabBar.backgroundColor = UIColor.black
		navBar.tintColor = UIColor.white
		tabBar.tintColor = UIColor.white
		navBar.barStyle = .default
		tabBar.barStyle = .default

		navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
		
	}
}
