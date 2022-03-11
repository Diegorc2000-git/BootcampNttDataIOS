//
//  IdentityProvider.swift
//  POCCambioDomicilio
//
//  Created by Diego Rodriguez Casillas on 9/3/22.
//

import Foundation

protocol IdentityProviderProtocol {
	func fetchData(completion: @escaping (IdentityServerModel) ->(), failure: @escaping (NetworkError) -> ())
	func fetchDataAddress(completion: @escaping (AddressServerModel) -> (), failure: @escaping (NetworkError) -> ())

}

class IdentityProvider{
	
	let networkService: NetworkServiceProtocol = NetworkService()
	
	
}

extension IdentityProvider: IdentityProviderProtocol {
	
	func fetchData(completion: @escaping (IdentityServerModel) ->(), failure: @escaping (NetworkError) -> ()){
		
		networkService.requestGeneric(dto: IdentityProviderRequestDTO.requestDataLista(
										param: IdentityRequest(
											anioNacimiento: 1996,
											numeroSoporte: "323243535")),
									  entityClass: IdentityServerModel.self) { [weak self] (result) in
			guard self != nil else { return }
			if let resultDes = result{
				completion(resultDes)
			}
		} failure: { [weak self] (error) in
			guard self != nil else { return }
			failure(error)
		}
	}
	
	func fetchDataAddress(completion: @escaping (AddressServerModel) -> (), failure: @escaping (NetworkError) -> ()) {
		
		networkService.requestGeneric(dto: AddressProviderRequestDTO.requestDataAddress(
										param: AddressRequest(
											espanol: "s")),
									  entityClass: AddressServerModel.self) { [weak self] (result) in
			guard self != nil else { return }
			if let resultDes = result{
				completion(resultDes)
			}
		} failure: { [weak self] (error) in
			guard self != nil else { return }
			failure(error)
		}
	}
}



struct IdentityRequest: ProviderParamsDTO {
	var anioNacimiento: Int?
	var numeroSoporte: String?
}

struct IdentityProviderRequestDTO {
	static func requestDataLista(param: ProviderParamsDTO?) -> RequestDTO {
		RequestDTO(param: param?.encodeData(), method: .post, endpoint: Constants.URL.getIdentity)
	}
}

struct AddressRequest: ProviderParamsDTO {
	var espanol: String?
}

struct AddressProviderRequestDTO {
	static func requestDataAddress(param: ProviderParamsDTO?) -> RequestDTO {
		RequestDTO(param: param?.encodeData(), method: .post, endpoint: Constants.URL.getAddress)
	}
}
