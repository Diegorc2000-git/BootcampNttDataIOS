//
//  TabBarHomeCoordinator.swift
//  NttdataTask
//
//  Created by Diego Rodriguez Casillas on 16/2/22.
//

import Foundation
import UIKit

final class TabBarHomeCoordinator {

	static func view() -> UITabBarController {
		let tbVC = TabBarViewController()
		
		let listVC = CarListCoordinator.navigation()
		
		let customButton = UITabBarItem(title: "Contacts",
										image: UIImage(named: "car"),
										selectedImage: UIImage(named: "car"))
		listVC.tabBarItem = customButton
		
		tbVC.viewControllers = [listVC]
		
		return tbVC
	}
	
}
