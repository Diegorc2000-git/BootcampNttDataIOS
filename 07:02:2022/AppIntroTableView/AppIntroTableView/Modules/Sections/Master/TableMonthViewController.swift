//
//  TableMonthViewController.swift
//  AppIntroTableView
//
//  Created by Diego Rodriguez Casillas on 7/2/22.
//

import UIKit

class TableMonthViewController: UIViewController {
	
	// MARK: - Variables
	let arrayMonths = ["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"]
	
	// MARK: - Outlets
	@IBOutlet weak var tableViewMonth: UITableView!
	
    override func viewDidLoad() {
        super.viewDidLoad()

		setupTableView()
    }

	private func setupTableView() {
		self.tableViewMonth.delegate = self
		self.tableViewMonth.dataSource = self
		//como registrar una celda en la tabla
		self.tableViewMonth.register(UINib(nibName: "MonthTableViewCell", bundle: nil), forCellReuseIdentifier: "MonthTableViewCell")
	}
	
}

extension TableMonthViewController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		//Que pasa cuando selecciono una de las celdas
		let vc = DetailCoordinator.view(dto: DetailCoordinatorDTO(nameMonth: self.arrayMonths[indexPath.row]))
		self.navigationController?.pushViewController(vc, animated: true)
	}
	
}

extension TableMonthViewController: UITableViewDataSource {
	//Siempre hay que usar estos tres metodos al usar tablas ¡¡LA BIBLIA DE LAS TABLAS!!
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.arrayMonths.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cellMonth = self.tableViewMonth.dequeueReusableCell(withIdentifier: "MonthTableViewCell", for: indexPath) as! MonthTableViewCell
		cellMonth.setupCell(name: self.arrayMonths[indexPath.row])
		return cellMonth
	}
}
