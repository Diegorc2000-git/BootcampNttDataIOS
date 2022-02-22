//
//  CategoryTableViewController.swift
//  NttdataTask
//
//  Created by Diego Rodriguez Casillas on 22/2/22.
//

import UIKit

protocol CategoryTableViewControllerDelegate: AnyObject {
	func nameCategorySelected(_ categoryClass: CategoryTableViewController, category row: String)
}

class CategoryTableViewController: UIViewController {

	weak var delegate: CategoryTableViewControllerDelegate?
	var nameCategorySelected = ""
	var selectIndexPath = IndexPath()
	
	var categoryList = ["Sin Categería", "Tienda de Appple", "Bar con los amigos", "En la libreria", "En casa", "En el paque", "En la peluquería", "En el trabajo"]
	
	// MARK: - IBOutlet
	@IBOutlet weak var myCategoryTbV: UITableView!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		setupArrayData()
		setupTableView()
    }

	func setupArrayData() {
		for index in 0..<categoryList.count {
			if categoryList[index] == nameCategorySelected {
				selectIndexPath = IndexPath(row: index, section: 0)
			}
		}
	}
	
	func setupTableView() {
		self.myCategoryTbV.delegate = self
		self.myCategoryTbV.dataSource = self
		self.myCategoryTbV.register(UINib(nibName: "TaskListCell", bundle: nil), forCellReuseIdentifier: "TaskListCell")
	}
}

extension CategoryTableViewController: UITableViewDataSource, UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.categoryList.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cellCategory = self.myCategoryTbV.dequeueReusableCell(withIdentifier: "TaskListCell", for: indexPath) as! TaskListCell
		
		cellCategory.titleTask.text = self.categoryList[indexPath.row]
		return cellCategory
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if indexPath != selectIndexPath {
			selectIndexPath = indexPath
			nameCategorySelected = categoryList[indexPath.row]
			self.delegate?.nameCategorySelected(self, category: nameCategorySelected)
			self.navigationController?.popViewController(animated: true)
		}
	}
	
}
