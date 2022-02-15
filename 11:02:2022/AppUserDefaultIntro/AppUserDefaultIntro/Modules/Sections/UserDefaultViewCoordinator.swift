//
//  UserDefaultViewCoordinator.swift
//  AppUserDefaultIntro
//
//  Created by Diego Rodriguez Casillas on 11/2/22.
//

import Foundation
import UIKit

final class UserDefaultViewCoordinator {
	
	static func navigation() -> UINavigationController {
		UINavigationController(rootViewController: view())
	}
	
	static func view() -> UserDefaultViewController {
		UserDefaultViewController()
	}
	
}
