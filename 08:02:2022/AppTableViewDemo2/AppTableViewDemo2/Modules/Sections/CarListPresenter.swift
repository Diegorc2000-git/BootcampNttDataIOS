//
//  CarListPresenter.swift
//  AppTableViewDemo2
//
//  Created by Diego Rodriguez Casillas on 8/2/22.
//

import Foundation
import UIKit

protocol CarListPresenterProtocol {
	func setArrayData()
	func numberOfRowCell() -> Int
	func getInformationCellForRow(indexPath: Int) -> CarsModel
}

final class CarListPresenter {
	
	var arrayCars: [CarsModel] = []
	
	let vc: CarListViewController?
	
	init(vc: CarListViewController) {
		self.vc = vc
	}
	
}

extension CarListPresenter: CarListPresenterProtocol {
	
	func setArrayData() {
		self.arrayCars.removeAll()
		self.arrayCars = [CarsModel(name: "Ferrari",
									color: "Rojo",
									image: UIImage(named: "ferrari_rojo")),
						  CarsModel(name: "Lamborghini",
									color: "Negro",
									image: UIImage(named: "lamborghini_negro")),
						  CarsModel(name: "Bugatti",
									color: "Azul",
									image: UIImage(named: "bugatti_azul")),
						  CarsModel(name: "Ferrari",
									color: "Rojo",
									image: UIImage(named: "ferrari_rojo")),
						  CarsModel(name: "Lamborghini",
									color: "Negro",
									image: UIImage(named: "lamborghini_negro")),
						  CarsModel(name: "Bugatti",
									color: "Azul",
									image: UIImage(named: "bugatti_azul")),
						  CarsModel(name: "Ferrari",
									color: "Rojo",
									image: UIImage(named: "ferrari_rojo")),
						  CarsModel(name: "Lamborghini",
									color: "Negro",
									image: UIImage(named: "lamborghini_negro")),
						  CarsModel(name: "Bugatti",
									color: "Azul",
									image: UIImage(named: "bugatti_azul")),
						  CarsModel(name: "Ferrari",
									color: "Rojo",
									image: UIImage(named: "ferrari_rojo")),
						  CarsModel(name: "Lamborghini",
									color: "Negro",
									image: UIImage(named: "lamborghini_negro")),
						  CarsModel(name: "Bugatti",
									color: "Azul",
									image: UIImage(named: "bugatti_azul")),
						  CarsModel(name: "Ferrari",
									color: "Rojo",
									image: UIImage(named: "ferrari_rojo")),
						  CarsModel(name: "Lamborghini",
									color: "Negro",
									image: UIImage(named: "lamborghini_negro")),
						  CarsModel(name: "Bugatti",
									color: "Azul",
									image: UIImage(named: "bugatti_azul")),
						  CarsModel(name: "Ferrari",
									color: "Rojo",
									image: UIImage(named: "ferrari_rojo")),
						  CarsModel(name: "Lamborghini",
									color: "Negro",
									image: UIImage(named: "lamborghini_negro")),
						  CarsModel(name: "Bugatti",
									color: "Azul",
									image: UIImage(named: "bugatti_azul")),
						  CarsModel(name: "Ferrari",
									color: "Rojo",
									image: UIImage(named: "ferrari_rojo")),
						  CarsModel(name: "Lamborghini",
									color: "Negro",
									image: UIImage(named: "lamborghini_negro")),
						  CarsModel(name: "Bugatti",
									color: "Azul",
									image: UIImage(named: "bugatti_azul")),
						  CarsModel(name: "Ferrari",
									color: "Rojo",
									image: UIImage(named: "ferrari_rojo")),
						  CarsModel(name: "Lamborghini",
									color: "Negro",
									image: UIImage(named: "lamborghini_negro")),
						  CarsModel(name: "Bugatti",
									color: "Azul",
									image: UIImage(named: "bugatti_azul"))
		]
		self.vc?.reloadCarsData()
	}
	
	
	func numberOfRowCell() -> Int {
		return self.arrayCars.count
	}
	
	func getInformationCellForRow(indexPath: Int) -> CarsModel {
		return self.arrayCars[indexPath]
	}
	
}
