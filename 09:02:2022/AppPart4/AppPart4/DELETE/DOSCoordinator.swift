//
//  DOSCoordinator.swift
//  AppPart4
//
//  Created by Diego Rodriguez Casillas on 10/2/22.
//

import Foundation
import UIKit

final class DOSCoordinator {
	
	static func navigation() -> UINavigationController {
		UINavigationController(rootViewController: view())
	}
	
	static func view() -> DOSViewController {
		let vc = DOSViewController()
		vc.presenter = presenter(vc: vc)
		return vc
	}
	
	static func presenter(vc: DOSViewController) -> DOSPresenterProtocol {
		let presenter = DOSPresenter(vc: vc)
		return presenter
	}
	
}
