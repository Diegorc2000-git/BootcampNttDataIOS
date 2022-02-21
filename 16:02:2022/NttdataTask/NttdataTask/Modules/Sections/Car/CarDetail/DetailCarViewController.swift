//
//  DetailCarViewController.swift
//  NttdataTask
//
//  Created by Diego Rodriguez Casillas on 16/2/22.
//

import UIKit

protocol DetailCarViewProtocol {
	func reloadDataModel()
}

class DetailCarViewController: UIViewController {

	// MARK: - ID
	var presenter: DetailCarPresenterProtocol?
	
	// MARK: - IBOutlets
	@IBOutlet weak var tableViewDetailCar: UITableView!
	
    override func viewDidLoad() {
        super.viewDidLoad()

		self.title = "Detalle del coche"
		self.presenter?.getDataModel()
		self.setupTableView()
    }

	private func setupTableView() {
		self.tableViewDetailCar.delegate = self
		self.tableViewDetailCar.dataSource = self
		self.tableViewDetailCar.register(UINib(nibName: "CarDetailCell", bundle: nil), forCellReuseIdentifier: "CarDetailCell")
	}

}

extension DetailCarViewController: DetailCarViewProtocol {
	
	func reloadDataModel() {
		self.tableViewDetailCar.reloadData()
	}
	
}

extension DetailCarViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let carDetailCell = self.tableViewDetailCar.dequeueReusableCell(withIdentifier: "CarDetailCell", for: indexPath) as! CarDetailCell
		if let modelData = self.presenter?.informationData() {
			carDetailCell.configDetailCell(data: modelData)
		}
		return carDetailCell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 886
	}

}
