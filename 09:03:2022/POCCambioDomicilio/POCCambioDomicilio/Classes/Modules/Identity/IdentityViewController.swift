//
//  IdentityViewController.swift
//  POCCambioDomicilio
//
//  Created by Diego Rodriguez Casillas on 9/3/22.
//

import UIKit

protocol IdentityViewPresenterInterface: ViewPresenterInterface {
	func reloadInformationInView()
}

class IdentityViewController: UIViewController, ViewInterface {

	var presenter: IdentityPresenterViewInterface!
	
	// MARK: - IBOutlet
	@IBOutlet weak var myProfileTableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.presenter.fetchDataProfile()
		self.setupTableView()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationController?.isNavigationBarHidden = true
	}
	
	func setupTableView() {
		self.myProfileTableView.delegate = self
		self.myProfileTableView.dataSource = self
		self.myProfileTableView.register(UINib(nibName: ProfileCell.defaultReuseIdentifierView, bundle: nil), forCellReuseIdentifier: ProfileCell.defaultReuseIdentifierView)
	}
	
}

extension IdentityViewController: IdentityViewPresenterInterface {
	
	func reloadInformationInView() {
		DispatchQueue.main.async {
			self.myProfileTableView.reloadData()
		}
	}
	
	
}

extension IdentityViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cellProfile = self.myProfileTableView.dequeueReusableCell(withIdentifier: ProfileCell.defaultReuseIdentifierView, for: indexPath) as! ProfileCell
		cellProfile.delegate = self
		if let model = self.presenter.dataCellModel {
			cellProfile.configCell(model: model)
		}
		return cellProfile
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		500
	}
	
}

extension IdentityViewController: ProfileCellDelegate {
	
	func showInfoProfile(_ cell: UITableViewCell, showMoreInfo: Bool) {
		if showMoreInfo {
			self.presenter.showMessageMoreInfoProfile()
		}
	}
	
}
