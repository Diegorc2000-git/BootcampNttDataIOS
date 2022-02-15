//
//  SignUpPresenter.swift
//  AppPart4
//
//  Created by Diego Rodriguez Casillas on 10/2/22.
//

import Foundation

protocol SignUpPresenterProtocol {
	
}

final class SignUpPresenter {
	
	let vc: SignUpViewController?
	
	init(vc: SignUpViewController) {
		self.vc = vc
	}
	
}

extension SignUpPresenter: SignUpPresenterProtocol {
	
}
