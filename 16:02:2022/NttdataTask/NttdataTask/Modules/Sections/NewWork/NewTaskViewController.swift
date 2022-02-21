//
//  NewTaskViewController.swift
//  NttdataTask
//
//  Created by Diego Rodriguez Casillas on 21/2/22.
//

import UIKit

class NewTaskViewController: UIViewController {

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
		if !(newTaskTitleTF.text?.isEmpty ?? false) && !(newTaskDescriptionTF.text?.isEmpty ?? false) {
			
			if let imageData: Data = self.newTaskImage.image?.jpegData(compressionQuality: 0.5) {
				
				SaveFavoritesPresenter.shared.addLocal(favorite: DownloadNewModel(pId: Int.random(in: 0..<999),
																				  pNewTask: self.newTaskTitleTF.text ?? "",
																				  pPriority: self.newTaskPriorityTF.text ?? "",
																				  pTaskDate: self.newTaskDateTF.text ?? "",
																				  pTaskDescription: self.newTaskDescriptionTF.text ?? "",
																				  pTaskCategory: self.newTaskCategoryTitle.text ?? "",
																				  pTaskImage: imageData)) { (success) in
					print("Alert 1")
				} failure: { (error) in
					print("Alert 2")
				}
				
			}
		} else {
			print("Alerta 3")
		}
		
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
		let actionSheet = UIAlertController(title: "Selecciona una Opcion", message: nil, preferredStyle: .actionSheet)
		actionSheet.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
		actionSheet.addAction(UIAlertAction(title: "Sacar Foto", style: .default, handler: { _ in
			self.takePhotoWithCamera()
		}))
		actionSheet.addAction(UIAlertAction(title: "Escoger de la libreria de foto", style: .default, handler: { _ in
			self.choosePhotoFromLibrary()
		}))
		present(actionSheet, animated: true, completion: nil)
	}
	// Acceder a la camara
	func takePhotoWithCamera() {
		let imagePicker = UIImagePickerController()
		imagePicker.sourceType = .camera
		imagePicker.delegate = self
		imagePicker.allowsEditing = true
		present(imagePicker, animated: true, completion: nil)
	}
	// Acceder a la galeria
	func choosePhotoFromLibrary() {
		let imagePicker = UIImagePickerController()
		imagePicker.sourceType = .photoLibrary
		imagePicker.delegate = self
		imagePicker.allowsEditing = true
		present(imagePicker, animated: true, completion: nil)
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
