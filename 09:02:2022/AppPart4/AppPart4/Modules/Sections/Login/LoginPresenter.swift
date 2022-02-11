//
//  LoginPresenter.swift
//  AppPart4
//
//  Created by Diego Rodriguez Casillas on 9/2/22.
//

import Foundation
import UIKit

protocol LoginPresenterProtocol {
	
}

final class LoginPresenter {
	
	let vc: LoginViewController?
	
	init(vc: LoginViewController) {
		self.vc = vc
	}
	
}

extension LoginPresenter: LoginPresenterProtocol {
	
}
