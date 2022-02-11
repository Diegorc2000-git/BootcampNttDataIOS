//
//  ProfileCoordinator.swift
//  AppTableViewDemo2
//
//  Created by Diego Rodriguez Casillas on 8/2/22.
//

import Foundation
import UIKit

final class ProfileCoordinator {
	
	static func navigation() -> UINavigationController {
		UINavigationController(rootViewController: view())
	}
	
	static func view() -> ProfileViewController {
		let vc = ProfileViewController()
		vc.presenter = presenter(vc: vc)
		return vc
	}
	
	static func presenter(vc: ProfileViewController) -> ProfilePresenterProtocol {
		let presenter = ProfilePresenter(vc: vc)
		return presenter
	}
	
}

