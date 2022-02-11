//
//  ProfileViewController.swift
//  AppTableViewDemo2
//
//  Created by Diego Rodriguez Casillas on 8/2/22.
//

import UIKit

protocol ProfileViewControllerProtocol {
	func reloadData()
}

class ProfileViewController: UIViewController {

	// MARK: - ID
	var presenter: ProfilePresenterProtocol?
	
	// MARK: - Outlets
	@IBOutlet weak var profileTableView: UITableView!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		self.title = "Perfil"
		self.presenter?.viewDidLoad()
		setupTableView()
		
    }
	
	func setupTableView() {
		self.profileTableView.delegate = self
		self.profileTableView.dataSource = self
		self.profileTableView.register(UINib(nibName: "ProfileTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileTableViewCell")
		self.profileTableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "PostTableViewCell")
	}

}

extension ProfileViewController: ProfileViewControllerProtocol {
	internal func reloadData() {
		self.profileTableView.reloadData()
	}
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 2
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		switch section {
		case 0:
			return 1
		default:
			return presenter?.getDataForRowPost() ?? 0
		}
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		switch indexPath.section {
		case 0:
			let cellProfile = profileTableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as! ProfileTableViewCell
			if let modelData = self.presenter?.getInformationProfileCell() {
				cellProfile.configureCell(model: modelData)
			}
			return cellProfile
		default:
			let cellPost = profileTableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
			if let modelData = self.presenter?.getInformationForRowCell(indexPath: indexPath.row) {
				cellPost.configureCell(postModel: modelData)
			}
			return cellPost
		}
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		switch indexPath.section {
		case 0:
			return 250
		default:
			//return 420 //no ponemos esto porque sino obligas a la vista a ser de 250 dp
			return UITableView.automaticDimension // hace que las celdas sean dinamicas y funciones por si solas
		}
	}
	
}
