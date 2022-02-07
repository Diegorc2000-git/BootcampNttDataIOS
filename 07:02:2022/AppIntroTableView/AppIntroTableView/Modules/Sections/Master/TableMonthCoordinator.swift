//
//  TableMonthCoordinator.swift
//  AppIntroTableView
//
//  Created by Diego Rodriguez Casillas on 7/2/22.
//

import Foundation
import UIKit

final class TableMonthCoordinator {
	static func navigation() -> UINavigationController {
		UINavigationController(rootViewController: view())
	}
	
	static func view() -> TableMonthViewController {
		TableMonthViewController()
	}
}
