//
//  TabBarCoordinator.swift
//  AppPart4
//
//  Created by Diego Rodriguez Casillas on 9/2/22.
//

import Foundation
import UIKit

final class TabBarCoordinator {
	
	static func view() -> TabBarViewController {
		let vc = TabBarViewController()
		
		let loginVC = LoginCoordinator.navigation()
		let signUpVC = SignUpCoordinator.navigation()
		let homeVC = StartCoordinator.navigation()
		let UNOVC = UNOCoordinator.navigation()
		let DOSVC = DOSCoordinator.navigation()
		
		vc.viewControllers = [loginVC, signUpVC, homeVC, UNOVC, DOSVC]
		
		return vc
	}
	
}
