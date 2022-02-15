//
//  UNOPresenter.swift
//  AppPart4
//
//  Created by Diego Rodriguez Casillas on 10/2/22.
//

import Foundation

protocol UNOPresenterProtocol {
	
}

final class UNOPresenter {
	
	let vc: UNOViewController?
	
	init(vc: UNOViewController) {
		self.vc = vc
	}
	
}

extension UNOPresenter: UNOPresenterProtocol {
	
}
