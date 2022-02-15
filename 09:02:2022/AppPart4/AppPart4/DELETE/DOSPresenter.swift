//
//  DOSPresenter.swift
//  AppPart4
//
//  Created by Diego Rodriguez Casillas on 10/2/22.
//

import Foundation

protocol DOSPresenterProtocol {
	
}

final class DOSPresenter {
	
	let vc: DOSViewController?
	
	init(vc: DOSViewController) {
		self.vc = vc
	}
	
}

extension DOSPresenter: DOSPresenterProtocol {
	
}
