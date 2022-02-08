//
//  SecondViewController.swift
//  NttDataApp
//
//  Created by Diego Rodriguez Casillas on 3/2/22.
//

import UIKit

class SecondViewController: UIViewController {

	let arrayCars = ["Ferrari", "Bugatti", "Lamborghini", "Alpine", "Aston Martin", "Rivian", "Mercedez", "Maybach", "Rolls Royce", "Bently"]
	
	@IBOutlet weak var tableCarsView: UITableView!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		setupTableView()
    }
	
	func setupTableView() {
		self.tableCarsView.delegate = self
		self.tableCarsView.dataSource = self
		self.tableCarsView.register(UINib(nibName: "CarTableViewCell", bundle: nil), forCellReuseIdentifier: "CarTableViewCell")
	}

}

extension SecondViewController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
		//Aqui iría la navegacion al detalle de la card seleccionada
		let vc = DetailCarCoordinator.view(dto: DetailCarCoordinatorDTO(carName: self.arrayCars[indexPath.row]))
		self.navigationController?.pushViewController(vc, animated: true)
	}
}

extension SecondViewController: UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.arrayCars.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cellCar = self.tableCarsView.dequeueReusableCell(withIdentifier: "CarTableViewCell", for: indexPath) as! CarTableViewCell
		cellCar.setupCell(name: self.arrayCars[indexPath.row])
		return cellCar
		
	}
}
