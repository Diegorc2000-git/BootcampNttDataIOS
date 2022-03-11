//
//  MessageRouter.swift
//  POCCambioDomicilio
//
//  Created by Diego Rodriguez Casillas on 9/3/22.
//

import Foundation
import UIKit

protocol MessageRouterPresenterInterface: RouterPresenterInterface {
	func dismisModalInformation()
}

final class MessageRouter: RouterInterface {
	
	weak var presenter: MessagePresenterRouterInterface!
	weak var viewController: UIViewController?
	
}

extension MessageRouter: MessageRouterPresenterInterface {
	
	func dismisModalInformation() {
		self.viewController?.dismiss(animated: false, completion: nil)
	}
}
