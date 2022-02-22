//
//  ListTaskViewController.swift
//  NttdataTask
//
//  Created by Diego Rodriguez Casillas on 21/2/22.
//

import UIKit

protocol ListTaskViewProtocol {
	func reloadDataInView()
}

class ListTaskViewController: UIViewController {

	// MARK: - ID
	var presenter: ListTaskPresenterProtocol?
	
	var downloads: [DownloadNewModel]?
	
	@IBOutlet weak var myTaskListTableView: UITableView!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		setupView()
		setupTableView()
    }
	
	func setupView() {
		SaveFavoritesPresenter.shared.getAllLocal { (results) in
			self.downloads = results?.downloads
		} failure: { (error) in
			print(error ?? "Aqui andres mete gamba")
		}

	}

	func setupTableView() {
		self.myTaskListTableView.delegate = self
		self.myTaskListTableView.dataSource = self
		self.myTaskListTableView.register(UINib(nibName: "TaskListCell", bundle: nil), forCellReuseIdentifier: "TaskListCell")

	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.myTaskListTableView.reloadData()
	}
}

extension ListTaskViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.downloads?.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cellDownload = self.myTaskListTableView.dequeueReusableCell(withIdentifier: "TaskListCell", for: indexPath) as! TaskListCell
		cellDownload.titleTask.text = self.downloads?[indexPath.row].newTask
		cellDownload.priorityTask.text = self.downloads?[indexPath.row].priority
		cellDownload.dateTask.text = self.downloads?[indexPath.row].taskDate
		cellDownload.categoryTask.text = self.downloads?[indexPath.row].taskCategory
		//imageTask
		cellDownload.descriptionTask.text = self.downloads?[indexPath.row].taskDescription
		//cellDownload.imageTask.image = UIImage(named: downloads.taskImage )

		return cellDownload
	
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		300
	}
	
}

extension ListTaskViewController: ListTaskViewProtocol {
	
	func reloadDataInView() {
		self.myTaskListTableView.reloadData()
	}
}
