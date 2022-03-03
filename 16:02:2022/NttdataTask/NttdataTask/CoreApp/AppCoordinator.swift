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
	
	private func customUI() {
		let navigationBar = UINavigationBar.appearance()
		let tabBar = UITabBar.appearance()
		
		navigationBar.backgroundColor = UIColor.black
		tabBar.backgroundColor = UIColor.black
		navigationBar.tintColor = UIColor.white
		tabBar.tintColor = UIColor.white
		navigationBar.barStyle = .default
		tabBar.barStyle = .default

		navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
	}
}
