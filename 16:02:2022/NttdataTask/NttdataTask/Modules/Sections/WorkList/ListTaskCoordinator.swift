//
//  ListTaskCoordinator.swift
//  NttdataTask
//
//  Created by Diego Rodriguez Casillas on 22/2/22.
//

import Foundation
import UIKit

final class ListTaskCoordinator {
	static func navigation() -> UINavigationController {
		UINavigationController(rootViewController: view())
	}
	
	static func view() -> ListTaskViewController {
		let vc = ListTaskViewController()
		vc.presenter = presenter(vc: vc)
		return vc
	}
	
	static func presenter(vc: ListTaskViewController) -> ListTaskPresenterProtocol {
		let presenter = ListTaskPresenter(vc: vc)
		return presenter
	}

}
