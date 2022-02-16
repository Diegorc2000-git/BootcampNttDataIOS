//
//  CarListViewController.swift
//  NttdataTask
//
//  Created by Diego Rodriguez Casillas on 16/2/22.
//

import UIKit

protocol CarListViewProtocol {
	func reloadDataInView()
}

class CarListViewController: UIViewController {
	
	// MARK: - ID
	var presenter: CarListPresenterProtocol?
	
	// MARK: - IBOutlet
	@IBOutlet weak var carListTableView: UITableView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.title = "Coches"
		self.presenter?.viewDidLoadInPresent()
		self.setupTableView()
    }
	
	private func setupTableView() {
		self.carListTableView.delegate = self
		self.carListTableView.dataSource = self
		self.carListTableView.register(UINib(nibName: "CarCell", bundle: nil), forCellReuseIdentifier: "CarCell")
	}

}

extension CarListViewController: CarListViewProtocol {
	
	func reloadDataInView() {
		self.carListTableView.reloadData()
	}
	
}

extension CarListViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.presenter?.numberOfRowInSection() ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let carCell = self.carListTableView.dequeueReusableCell(withIdentifier: "CarCell", for: indexPath) as! CarCell
		if let modelData = self.presenter?.informationCell(indexPath: indexPath.row) {
			carCell.configCell(data: modelData)
		}
		return carCell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 100
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if let modelData = self.presenter?.informationCell(indexPath: indexPath.row) {
			self.presenter?.showDetailCar(dto: modelData)
		}
	}
}
