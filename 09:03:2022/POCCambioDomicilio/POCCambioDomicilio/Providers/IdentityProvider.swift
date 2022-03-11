//
//  IdentityProvider.swift
//  POCCambioDomicilio
//
//  Created by Diego Rodriguez Casillas on 9/3/22.
//

import Foundation

protocol IdentityProviderProtocol {
	
}

class IdentityProvider {
	
	let networkService: NetworkServiceProtocol = NetworkService()
	
}

extension IdentityProvider: IdentityProviderProtocol {
	
}

struct IdentityProviderRequestDTO {
	
}

