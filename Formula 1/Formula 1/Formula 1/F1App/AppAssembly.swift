//
//  AppAssembly.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 1/3/22.
//

import Foundation
import UIKit

protocol AppAssemblyProtocol {
	func showInitialApp(window: UIWindow)
}

final class AppAssembly: AppAssemblyProtocol {
	
	private var initialVC = UIViewController()
	internal func showInitialApp(window: UIWindow) {
		self.customTabBar()
		self.customNavigationBar()
		initialVC = TabBarHomeAssembly.view()
		window.rootViewController = initialVC
		window.makeKeyAndVisible()
	}
	
	private func customTabBar() {
		let tabBar = UITabBar.appearance()
		
		tabBar.tintColor = UIColor.red
		tabBar.backgroundColor = UIColor.white
		tabBar.barStyle = .default

	}
	
	private func customNavigationBar() {
		let navigationBar = NavigationBarModel()
		
		
	}
	
}
