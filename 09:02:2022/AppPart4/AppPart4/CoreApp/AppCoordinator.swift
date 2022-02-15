//
//  AppCoordinator.swift
//  AppPart4
//
//  Created by Diego Rodriguez Casillas on 9/2/22.
//

import Foundation
import UIKit

protocol AppCoordinatorProtocol {
	
}

final class AppCoordinator: AppCoordinatorProtocol {
	
	private var initialViewController = UIViewController()
	
	internal func showInitialViewController(window: UIWindow) {
		self.customUI()
		initialViewController = RegistrationCoordinator.view()
		window.rootViewController = initialViewController
		window.makeKeyAndVisible()
	}
	
	private func customUI() {
		let navBar = UINavigationBar.appearance()
		let tabBar = UITabBar.appearance()
		
		navBar.barTintColor = UIColor.black
		tabBar.barTintColor = UIColor.black
		navBar.tintColor = UIColor.white
		tabBar.tintColor = UIColor.white
		navBar.barStyle = .black
		tabBar.barStyle = .black
		navBar.backgroundColor = UIColor.black
		tabBar.backgroundColor = UIColor.black
		navBar.isTranslucent = false
		tabBar.isTranslucent = false
		navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
		
	}
}
