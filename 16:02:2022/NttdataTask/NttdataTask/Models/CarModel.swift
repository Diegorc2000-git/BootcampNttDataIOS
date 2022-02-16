//
//  CarModel.swift
//  NttdataTask
//
//  Created by Diego Rodriguez Casillas on 16/2/22.
//

import Foundation

// MARK: - CarsModel
struct CarsModel: Codable {
	let arrayCars: [ArrayCar]?

	enum CodingKeys: String, CodingKey {
		case arrayCars = "arrayCars"
	}
}

// MARK: - ArrayCar
struct ArrayCar: Codable {
	let name: String?
	let milesPerGallon: Int?
	let cylinders: Int?
	let displacement: Int?
	let horsepower: Int?
	let weightInLbs: Int?
	let acceleration: Double?
	let year: String?
	let image: String?
	let origin: String?

	enum CodingKeys: String, CodingKey {
		case name = "Name"
		case milesPerGallon = "Miles_per_Gallon"
		case cylinders = "Cylinders"
		case displacement = "Displacement"
		case horsepower = "Horsepower"
		case weightInLbs = "Weight_in_lbs"
		case acceleration = "Acceleration"
		case year = "Year"
		case image = "Image"
		case origin = "Origin"
	}
}

extension CarsModel {
	
	static var stubbedCars: [ArrayCar]? {
		do {
			let response: CarsModel? = try Bundle.main.loadAndDecodeJson(filename: "carJson")
			return response?.arrayCars ?? []
		} catch {
			
		}
		return nil
	}
}

extension Bundle {
	
	func loadAndDecodeJson<D: Decodable>(filename: String) throws -> D? {
		guard let url = self.url(forResource: filename, withExtension: ".json") else {
			return nil
		}
		let data = try? Data(contentsOf: url)
		let jsonDecode = Utils.jsonDecoder
		let decodeModel = try? jsonDecode.decode(D.self, from: data!)
		return decodeModel
	}
}

class Utils {
	static let jsonDecoder: JSONDecoder = {
		let jsonDecoder = JSONDecoder()
		jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
		jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
		return jsonDecoder
	}()
	
	static let dateFormatter: DateFormatter = {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-mm-dd"
		return dateFormatter
	}()
}
