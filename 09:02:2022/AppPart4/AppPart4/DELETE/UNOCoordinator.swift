//
//  UNOCoordinator.swift
//  AppPart4
//
//  Created by Diego Rodriguez Casillas on 10/2/22.
//

import Foundation
import UIKit

final class UNOCoordinator {
	
	static func navigation() -> UINavigationController {
		UINavigationController(rootViewController: view())
	}
	
	static func view() -> UNOViewController {
		let vc = UNOViewController()
		vc.presenter = presenter(vc: vc)
		return vc
	}
	
	static func presenter(vc: UNOViewController) -> UNOPresenterProtocol {
		let presenter = UNOPresenter(vc: vc)
		return presenter
	}
	
}
