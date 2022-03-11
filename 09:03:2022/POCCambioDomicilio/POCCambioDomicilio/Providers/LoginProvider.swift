//
//  LoginProvider.swift
//  POCCambioDomicilio
//
//  Created by Diego Rodriguez Casillas on 9/3/22.
//

import Foundation

protocol LoginProviderProtocol {
	
}

class LoginProvider {
	
	let networkService: NetworkServiceProtocol = NetworkService()
	
}

extension LoginProvider: LoginProviderProtocol {
	
}

struct LoginProviderRequestDTO {
	
}

