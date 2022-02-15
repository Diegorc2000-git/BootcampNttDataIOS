//
//  RegistrationCoordinator.swift
//  AppPart4
//
//  Created by Diego Rodriguez Casillas on 14/2/22.
//

import Foundation
import UIKit

final class RegistrationCoordinator {
	
	static func view() -> LoginViewController {
		let vc = LoginViewController()
		
		let loginVC = LoginCoordinator.navigation()
		let signUpVC = SignUpCoordinator.navigation()
		
		vc.viewControllers = [loginVC, signUpVC]
		
		return vc
	}
	
}
