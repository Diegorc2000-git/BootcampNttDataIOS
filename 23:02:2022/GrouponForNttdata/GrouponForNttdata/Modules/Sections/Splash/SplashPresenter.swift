//
//  SplashPresenter.swift
//  GrouponForNttdata
//
//  Created by Diego Rodriguez Casillas on 23/2/22.
//

import Foundation

protocol SplashPresenterProtocol {
	
}

protocol SplashInteractorOutputProtocol {
	func getDataFromBusiness(data: [Card]?)
}

class SplashPresenter: BasePresenter<SplashViewProtocol, SplashRouterProtocol, SplashInteractorProtocol> {
	
}

extension SplashPresenter: SplashPresenterProtocol {
	
	func getDataFromBusiness(data: [Card]?) {
		//
	}
}
