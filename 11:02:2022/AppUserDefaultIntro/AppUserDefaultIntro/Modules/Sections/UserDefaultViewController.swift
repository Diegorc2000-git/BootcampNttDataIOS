//
//  UserDefaultViewController.swift
//  AppUserDefaultIntro
//
//  Created by Diego Rodriguez Casillas on 11/2/22.
//

import UIKit

class UserDefaultViewController: UIViewController {
	
	// MARK: - OUtlets
	@IBOutlet weak var saveInfo: UIButton!
	@IBOutlet weak var updateInfo: UIButton!
	@IBOutlet weak var nameTextField: UITextField!
	@IBOutlet weak var surnameTextField: UITextField!
	@IBOutlet weak var adressTextField: UITextField!
	@IBOutlet weak var phoneTextField: UITextField!
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var lastUpdateLabel: UILabel!
	
	var existPhoto = false
	
	// MARK: - Actions
	//Para salvar la informacion
	@IBAction func saveDataPressed(_ sender: Any) {
		
		if !(nameTextField.text?.isEmpty ?? false) &&
			!(surnameTextField.text?.isEmpty ?? false) &&
			!(adressTextField.text?.isEmpty ?? false) &&
			!(phoneTextField.text?.isEmpty ?? false) &&
			existPhoto {
			
			Utils.UserDefaultDataBase.prefs.set(self.nameTextField.text, forKey: Utils.Constants.name)
			Utils.UserDefaultDataBase.prefs.set(self.surnameTextField.text, forKey: Utils.Constants.surname)
			Utils.UserDefaultDataBase.prefs.set(self.adressTextField.text, forKey: Utils.Constants.adress)
			Utils.UserDefaultDataBase.prefs.set(self.phoneTextField.text, forKey: Utils.Constants.phone)
			
			let actualDate = Date()
			Utils.UserDefaultDataBase.prefs.set(actualDate, forKey: Utils.Constants.lastUpdate)
			
			let imageData = self.imageView.image?.jpegData(compressionQuality: 0.5)
			Utils.UserDefaultDataBase.prefs.set(imageData, forKey: Utils.Constants.imageUser)

			present(Utils.showAlertView(title: "Hey!", message: "Los datos se han salvado correctamente", callBack: {
				self.nameTextField.text = ""
				self.surnameTextField.text = ""
				self.adressTextField.text = ""
				self.phoneTextField.text = ""
				self.lastUpdateLabel.text = ""
				self.imageView.image = UIImage(named: "placeHolder")
			}), animated: true, completion: nil)
			
		} else {
			present(Utils.showAlertView(title: "Hey!", message: "Rellena todos los datos", callBack: {
				//
			}), animated: true, completion: nil)
		}
		
	}
	//Para recuperar los datos
	@IBAction func updateDataPressed(_ sender: Any) {
		if let imageData = Utils.UserDefaultDataBase.prefs.object(forKey: Utils.Constants.imageUser) as? Data {
			self.imageView.image = UIImage(data: imageData)
		}
		
		Utils.UserDefaultDataBase.dateFormatter.dateStyle = .medium
		
		if let lastUpdate = Utils.UserDefaultDataBase.prefs.object(forKey: Utils.Constants.lastUpdate) as? Date {
			self.lastUpdateLabel.text = "Ultima actualización \(Utils.UserDefaultDataBase.dateFormatter.string(from: lastUpdate as Date))"
		} else {
			self.lastUpdateLabel.text = "Ultima actualización no realizada"
		}
		
		if let nameData = Utils.UserDefaultDataBase.prefs.string(forKey: Utils.Constants.name) {
			self.nameTextField.text = nameData
		}
		
		if let surnameData = Utils.UserDefaultDataBase.prefs.string(forKey: Utils.Constants.surname) {
			self.surnameTextField.text = surnameData
		}
		
		if let adressData = Utils.UserDefaultDataBase.prefs.string(forKey: Utils.Constants.adress) {
			self.adressTextField.text = adressData
		}
		
		if let phoneData = Utils.UserDefaultDataBase.prefs.string(forKey: Utils.Constants.phone) {
			self.phoneTextField.text = phoneData
		}
		
	}
	
	// MARK: - Controlator life
    override func viewDidLoad() {
        super.viewDidLoad()

		//Imagen clickable y poder hacer una foto
		self.imageView.isUserInteractionEnabled = true // Habilitamos la interaccion con la imagen
		let tapGR = UITapGestureRecognizer(target: self, action: #selector(showActionGesture))
		self.imageView.addGestureRecognizer(tapGR) // Habilito la imagen, creo un gestor de reconocimiento y le meto gestor de reconocimiento a la imagen
    }
	
	// MARK: - Private Methods
	@objc // Ponemos esto porque el #selector desciende de objective-C
	func showActionGesture() {
		showPickerPhoto()
	}
	
}

extension UserDefaultViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate { // Para poder acceder a las fotos
	func showPickerPhoto() {
		if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
			showPhotoMenu()
		} else {
			choosePhotoFromLibrary()
		}
	}
	// Menu camara/galeria
	func showPhotoMenu() {
		let actionSheet = UIAlertController(title: "Selecciona la Opcion", message: nil, preferredStyle: .actionSheet)
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
	// Pintar la imagen
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		if let pickerImage = info[.originalImage] as? UIImage {
			self.imageView.contentMode = .scaleToFill
			self.imageView.image = pickerImage
			self.existPhoto = true
		}
		
		dismiss(animated: true, completion: nil)
	}
	
	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		dismiss(animated: true, completion: nil)
	}
	
}

class Utils {
	
	// MARK: - Constant
	struct Constants {
		static let name = "Name"
		static let surname = "Surname"
		static let adress = "Adress"
		static let phone = "Phone"
		static let lastUpdate = "Last Update"
		static let imageUser = "Image User"
	}
	
	struct UserDefaultDataBase {
		static let prefs = UserDefaults.standard
		static let dateFormatter = DateFormatter() // Si se le pone static al principio no haria falta poner los parentesis cuando se le llame
	}
	
	static func showAlertView(title: String, message: String, callBack: @escaping () -> ()) -> UIAlertController {
		let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
		alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
			callBack()
		}))
		return alertVC
	}
}
