//
//  IdentityInteractor.swift
//  POCCambioDomicilio
//
//  Created by Diego Rodriguez Casillas on 9/3/22.
//

import Foundation

protocol IdentityInteractorPresenterInterface: InteractorPresenterInterface {
	func fetchDataIdentityInteractor()
}

class IdentityInteractor: InteractorInterface {
	
	weak var presenter: IdentityPresenterInteractorInterface!
	let provider: IdentityProviderProtocol = IdentityProvider()
	
	private func transformDataToIdentityBussinessModel(data: IdentityServerModel) -> IdentityBussinessModel? {
		var model: IdentityBussinessModel?
		model = IdentityBussinessModel(
			transmisiones: TransmisionesViewModel(
				transmisionDatos: [TransmisionDatoViewModel(
					datosGenericos: DatosGenericosViewModel(
						titular: TitularViewModel(
							tipoDocumentacion: data.transmisiones?.transmisionDatos?[0].datosGenericos?.titular?.tipoDocumentacion,
							documentacion: data.transmisiones?.transmisionDatos?[0].datosGenericos?.titular?.documentacion,
							nombreCompleto: data.transmisiones?.transmisionDatos?[0].datosGenericos?.titular?.nombreCompleto,
							nombre: data.transmisiones?.transmisionDatos?[0].datosGenericos?.titular?.nombre,
							apellido1: data.transmisiones?.transmisionDatos?[0].datosGenericos?.titular?.apellido1,
							apellido2: data.transmisiones?.transmisionDatos?[0].datosGenericos?.titular?.apellido2)),
					datosEspecificos: DatosEspecificosViewModel(
						retorno: RetornoViewModel(
							datosTitular: DatosTitularViewModel(
								fechaCaducidad: data.transmisiones?.transmisionDatos?[0].datosEspecificos?.retorno?.datosTitular?.fechaCaducidad))))]))
		return model
	}
	
	private func transformDataToAddressBussinessModel(data: AddressServerModel) -> AddressBusinessModel? {
		var model: AddressBusinessModel?
		model = AddressBusinessModel(
			transmisiones: DRTransmisionesViewModel(
				transmisionDatos: [DRTransmisionDatoViewModel(
					direccion: data.transmisiones?.transmisionDatos?[0].datosEspecificos?.retorno?.domicilio?.direccion?.via?.nombre,
					municipioRespuesta: data.transmisiones?.transmisionDatos?[0].datosEspecificos?.retorno?.domicilio?.municipioRespuesta?.nombre)]))
		return model
	}
	
	private func transformDataToProfileViewModel(identityServerModel: IdentityServerModel, addressServerModel: AddressServerModel) -> ProfileViewModel? {
		let identityBusinessModel = self.transformDataToIdentityBussinessModel(data: identityServerModel)
		let addressBusinessModel = self.transformDataToAddressBussinessModel(data: addressServerModel)
		
		var model: ProfileViewModel?
		model = ProfileViewModel(name: identityBusinessModel?.transmisiones?.transmisionDatos?[0].datosGenericos?.titular?.nombreCompleto,
								 lastUpdate: identityBusinessModel?.transmisiones?.transmisionDatos?[0].datosEspecificos?.retorno?.datosTitular?.fechaCaducidad,
								 lastName: identityBusinessModel?.transmisiones?.transmisionDatos?[0].datosGenericos?.titular?.apellido1,
								 identityDoc: identityBusinessModel?.transmisiones?.transmisionDatos?[0].datosGenericos?.titular?.documentacion,
								 validityData: identityBusinessModel?.transmisiones?.transmisionDatos?[0].datosEspecificos?.retorno?.datosTitular?.fechaCaducidad,
								 addressData: addressBusinessModel?.transmisiones?.transmisionDatos?[0].direccion,
								 cityData: addressBusinessModel?.transmisiones?.transmisionDatos?[0].municipioRespuesta)
		return model
	}

}

extension IdentityInteractor: IdentityInteractorPresenterInterface {
	
	func fetchDataIdentityInteractor() {
		self.provider.fetchData { [weak self] (resultIdentityServerModel) in
			guard self != nil else { return }
			self?.provider.fetchDataAddress(completion: { [weak self] (resultAddressServerModel) in
				guard self != nil else { return }
				if let data = self?.transformDataToProfileViewModel(identityServerModel: resultIdentityServerModel, addressServerModel: resultAddressServerModel) {
					self?.presenter.getDataProfileView(data: data)
				}
			}, failure: { (networkError) in
				//
			})
		} failure: { (networkError) in
			//
		}
	}

}
