//
//  GrouponListDetailInteractor.swift
//  GrouponForNttdata
//
//  Created by Diego Rodriguez Casillas on 8/3/22.
//

import Foundation

protocol GrouponListDetailInteractorPresenterInterface: InteractorPresenterInterface {
	
}

class GrouponListDetailInteractor: InteractorInterface {
	
	weak var presenter: GrouponListDetailPresenterInteractorInterface!
	let provider: GrouponListDetailProviderProtocol = GrouponListDetailProvider()
	
}

extension GrouponListDetailInteractor: GrouponListDetailInteractorPresenterInterface {
	
}
