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
		
		//1
		let listVC = CarListCoordinator.navigation()
		let customButton = UITabBarItem(title: "Contacts",
										image: UIImage(named: "car")?.withRenderingMode(.alwaysOriginal),
										selectedImage: UIImage(named: "car")?.withRenderingMode(.alwaysOriginal))
		listVC.tabBarItem = customButton
		
		//2
		let newTaskVC = NewTaksCoordinator.navigation()
		let customButton2 = UITabBarItem(title: "Task list",
										 image: UIImage(named: "three")?.withRenderingMode(.alwaysOriginal),
										 selectedImage: UIImage(named: "three")?.withRenderingMode(.alwaysOriginal))
		newTaskVC.tabBarItem = customButton2
		
		//3
		let taskListVC = ListTaskViewController()
		let customButton3 = UITabBarItem(title: "TasK",
										 image: UIImage(named: "one")?.withRenderingMode(.alwaysOriginal),
										 selectedImage: UIImage(named: "one")?.withRenderingMode(.alwaysOriginal))
		taskListVC.tabBarItem = customButton3
		
		tbVC.viewControllers = [listVC, newTaskVC, taskListVC]
		
		return tbVC
	}
	
}
