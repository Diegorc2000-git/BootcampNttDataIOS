//
//  CarListCoordinator.swift
//  NttdataTask
//
//  Created by Diego Rodriguez Casillas on 16/2/22.
//

import Foundation
import UIKit

final class CarListCoordinator {
	static func navigation() -> UINavigationController {
		UINavigationController(rootViewController: view())
	}
	
	static func view() -> CarListViewController {
		CarListViewController()
	}
}
