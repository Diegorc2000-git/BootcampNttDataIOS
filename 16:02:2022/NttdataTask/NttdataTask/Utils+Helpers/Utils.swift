//
//  Utils.swift
//  NttdataTask
//
//  Created by Diego Rodriguez Casillas on 21/2/22.
//

import Foundation
import UIKit

class Utils {
	static let jsonDecoder: JSONDecoder = {
		let jsonDecoder = JSONDecoder()
		jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
		jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
		return jsonDecoder
	}()
	
	static let dateFormatter: DateFormatter = {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-mm-dd"
		return dateFormatter
	}()
}

class ManagerPhoto: NSObject {

		// Menu camara/galeria
		func showPhotoMenu() -> UIAlertController {
			let alertVC = UIAlertController(title: "Selecciona la Opcion", message: nil, preferredStyle: .actionSheet)
			let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
			let takePhotoAction = UIAlertAction(title: "Sacar Foto", style: .default) { Void in
				self.takePhotoWithCamera()
			}
			let chooseFromLibraryAction = UIAlertAction(title: "Escoger de la libreria de foto", style: .default) { Void in
				self.choosePhotoFromLibrary(completion: { data in
					let imagePicker = data
					imagePicker.sourceType = .photoLibrary
					imagePicker.delegate = self
					imagePicker.allowsEditing = true
				})
			}
			alertVC.addAction(cancelAction)
			alertVC.addAction(takePhotoAction)
			alertVC.addAction(chooseFromLibraryAction)
			
			return alertVC
		}
		// Acceder a la camara
		func takePhotoWithCamera() -> UIImagePickerController {
			let imagePicker = UIImagePickerController()
			imagePicker.sourceType = .camera
			imagePicker.delegate = self
			imagePicker.allowsEditing = true
			
			return imagePicker
		}
		// Acceder a la galeria
	func choosePhotoFromLibrary(completion: @escaping (UIImagePickerController) -> ()) {
			let imagePicker = UIImagePickerController()
			
			completion(imagePicker)
			
	}
	
}

extension ManagerPhoto: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
//	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//		if let pickerImage = info[.originalImage] as? UIImage {
//			self.imageView.contentMode = .scaleToFill
//			self.imageView.image = pickerImage
//			self.existPhoto = true
//		}
//
//		dismiss(animated: true, completion: nil)
//	}
//
//	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//		dismiss(animated: true, completion: nil)
//	}
	
}

