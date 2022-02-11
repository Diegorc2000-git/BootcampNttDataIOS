//
//  HomeCoordinator.swift
//  AppTableViewDemo2
//
//  Created by Diego Rodriguez Casillas on 8/2/22.
//

import Foundation
import UIKit

final class HomeCoordinator {
	
	static func view() -> HomeViewController {
		let vc = HomeViewController()
		
		let vcListCoor = CarListCoordinador.navigation()
		let vcProfileCoor = ProfileCoordinator.navigation()
		
		vc.viewControllers = [vcListCoor, vcProfileCoor]
		
		return vc
	}
	
}
