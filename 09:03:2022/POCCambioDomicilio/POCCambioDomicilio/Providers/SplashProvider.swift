//
//  SplashProvider.swift
//  POCCambioDomicilio
//
//  Created by Diego Rodriguez Casillas on 9/3/22.
//

import Foundation

protocol SplashProviderProtocol {
	
}

class SplashProvider {
	
	let networkService: NetworkServiceProtocol = NetworkService()
	
}

extension SplashProvider: SplashProviderProtocol {
	
}

struct SplashProviderRequestDTO {
	
}
