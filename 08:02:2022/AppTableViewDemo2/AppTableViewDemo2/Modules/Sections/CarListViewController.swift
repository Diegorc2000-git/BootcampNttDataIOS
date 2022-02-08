//
//  CarListViewController.swift
//  AppTableViewDemo2
//
//  Created by Diego Rodriguez Casillas on 8/2/22.
//

import UIKit

protocol CarListViewProtocol {
	func reloadCarsData()
}

class CarListViewController: UIViewController {

	// MARK: - ID
	var presenter: CarListPresenterProtocol?
	
	// MARK: - Outlets
	@IBOutlet weak var carTableView: UITableView!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		self.presenter?.setArrayData()
		setupTableView()
	}
	
	private func setupTableView() {
		self.carTableView.delegate = self
		self.carTableView.dataSource = self
		self.carTableView.register(UINib(nibName: "CarTableViewCell", bundle: nil), forCellReuseIdentifier: "CarTableViewCell")
	}

}

extension CarListViewController: CarListViewProtocol {
	
	func reloadCarsData() {
		self.carTableView.reloadData()
	}
	
}

extension CarListViewController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.presenter?.numberOfRowCell() ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cellCar = self.carTableView.dequeueReusableCell(withIdentifier: "CarTableViewCell", for: indexPath) as! CarTableViewCell
		if let modelData = self.presenter?.getInformationCellForRow(indexPath: indexPath.row) {
			cellCar.configCell(model: modelData)
		}
		return cellCar
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 90
	}
}

extension CarListViewController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		//
	}
}

