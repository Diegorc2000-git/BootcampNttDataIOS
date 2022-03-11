//
//  AdressBusinessModel.swift
//  POCCambioDomicilio
//
//  Created by Diego Rodriguez Casillas on 11/3/22.
//

import Foundation

struct AddressBusinessModel {
	let transmisiones: DRTransmisionesViewModel?
}

struct DRTransmisionesViewModel {
	let transmisionDatos: [DRTransmisionDatoViewModel]?
}

struct DRTransmisionDatoViewModel {
	let direccion: String?
	let municipioRespuesta: String?
}
