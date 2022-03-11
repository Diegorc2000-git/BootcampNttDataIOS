//
//  MessageProvider.swift
//  POCCambioDomicilio
//
//  Created by Diego Rodriguez Casillas on 9/3/22.
//

import Foundation

protocol MessageProviderProtocol {
	
}

class MessageProvider {
	
	let networkService: NetworkServiceProtocol = NetworkService()
	
}

extension MessageProvider: MessageProviderProtocol {
	
}

struct MessageProviderRequestDTO {
	
}
