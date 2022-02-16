//
//  CarListViewController.swift
//  NttdataTask
//
//  Created by Diego Rodriguez Casillas on 16/2/22.
//

import UIKit

class CarListViewController: UIViewController {

	// MARK: - Variables
	var arrayCars: [ArrayCar] = []
	
	// MARK: - IBOutlet
	@IBOutlet weak var carListTableView: UITableView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		if let model = CarsModel.stubbedCars {
			self.arrayCars = model
		}
		self.setupTableView()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		self.carListTableView.reloadData()
	}
	
	private func setupTableView() {
		self.carListTableView.delegate = self
		self.carListTableView.dataSource = self
		self.carListTableView.register(UINib(nibName: "CarCell", bundle: nil), forCellReuseIdentifier: "CarCell")
	}

}

extension CarListViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.arrayCars.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let carCell = self.carListTableView.dequeueReusableCell(withIdentifier: "CarCell", for: indexPath) as! CarCell
		carCell.configCell(data: self.arrayCars[indexPath.row])
		return carCell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 100
	}
}
