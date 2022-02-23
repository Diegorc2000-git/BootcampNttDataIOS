//
//  NewTaskViewController.swift
//  NttdataTask
//
//  Created by Diego Rodriguez Casillas on 21/2/22.
//

import UIKit

protocol NewTaskViewProtocol {
	
}

class NewTaskViewController: UIViewController {

	// MARK: - ID
	var presenter: NewTaskPresenterProtocol?
	
	// MARK: - Variables Locales Globales
	var arrayPrioridad = ["Alta", "Media - Alta", "Media", "Baja", "Sin Prioridad"]
	let Text_Field_LIMIT = 140
	var categoryName = "Sin Categoría"
	var photoSelected = false

	// MARK: - IBOutlet
	@IBOutlet weak var newTaskTitle: UILabel!
	@IBOutlet weak var newTaskTitleTF: UITextField!
	
	@IBOutlet weak var newTaskPriority: UILabel!
	@IBOutlet weak var newTaskPriorityTF: UITextField!
	
	@IBOutlet weak var newTaskDate: UILabel!
	@IBOutlet weak var newTaskDateTF: UITextField!

	@IBOutlet weak var newTaskDescription: UILabel!
	@IBOutlet weak var newTaskDescriptionTF: UITextField!
	@IBOutlet weak var newTaskCharacCont: UILabel!
	
	@IBOutlet weak var newTaskTitleImage: UILabel!
	@IBOutlet weak var newTaskImage: UIImageView!

	@IBOutlet weak var newTaskButtonCategory: UIButton!
	@IBOutlet weak var newTaskCategoryTitle: UILabel!
	@IBOutlet weak var newTaskSaveTaskButton: UIButton!

	@IBAction func saveTask(_ sender: Any) {
		self.presenter?.saveTaskPressed()
	}
	
	@IBAction func showCategoryList(_ sender: Any) {
		let vc = CategoryTableViewController()
		vc.delegate = self
		self.navigationController?.pushViewController(vc, animated: true)
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		setupViews()
    }
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.view.endEditing(true)
	}

	func setupViews() {
		//Buttons
		self.newTaskButtonCategory.layer.cornerRadius = 10
		self.newTaskSaveTaskButton.layer.cornerRadius = 10
		
		//Image
		self.newTaskImage.layer.cornerRadius = 8
		self.newTaskImage.layer.borderWidth = 1
		self.newTaskImage.layer.borderColor = UIColor.black.cgColor
		self.newTaskImage.isUserInteractionEnabled = true
		let tapGr = UITapGestureRecognizer(target: self, action: #selector(showPickerImage))
		self.newTaskImage.addGestureRecognizer(tapGr)
		
		//PickerView_PriorityTF
		let pickerView = UIPickerView()
		pickerView.delegate = self
		self.newTaskPriorityTF.inputView = pickerView
		self.newTaskPriorityTF.text = arrayPrioridad[0]
		
	}
	
	@objc
	func showPickerImage() {
		if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
			showPhotoMenu()
		} else {
			choosePhotoFromLibrary()
		}
	}
	// Menu camara/galeria
	func showPhotoMenu() {
		self.presenter?.menuGallery()
	}
	// Acceder a la camara
	func takePhotoWithCamera() {
		self.presenter?.camera()
	}
	// Acceder a la galeria
	func choosePhotoFromLibrary() {
		self.presenter?.library()
	}
	
	private func textLimit(existingText: String?, newText: String, limit: Int) -> Bool {
		let text = existingText ?? ""
		let isAtLimit = text.count + newText.count <= limit
		return isAtLimit
	}
	
}

extension NewTaskViewController: UITextFieldDelegate {
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		return self.textLimit(existingText: newTaskDescriptionTF.text, newText: string, limit: Text_Field_LIMIT)
	}
}

extension NewTaskViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		if let pickerImage = info[.originalImage] as? UIImage {
			self.newTaskImage.contentMode = .scaleAspectFill
			self.newTaskImage.image = pickerImage
			self.photoSelected = true
		}
		
		dismiss(animated: true, completion: nil)
	}
	
	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		dismiss(animated: true, completion: nil)
	}
}
extension NewTaskViewController: UIPickerViewDataSource, UIPickerViewDelegate {
	
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return arrayPrioridad.count
	}
	
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return arrayPrioridad[row]
	}
	
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		newTaskPriorityTF.text = arrayPrioridad[row]
	}
	
}
extension NewTaskViewController: CategoryTableViewControllerDelegate {
	
	func nameCategorySelected(_ categoryClass: CategoryTableViewController, category row: String) {
		self.newTaskCategoryTitle.text = row
	}
	
}
extension NewTaskViewController: NewTaskViewProtocol {
	
}
