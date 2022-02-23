//
//  NewTaskPresenter.swift
//  NttdataTask
//
//  Created by Diego Rodriguez Casillas on 22/2/22.
//

import Foundation
import UIKit

protocol NewTaskPresenterProtocol {
	func saveTaskPressed()
	func library()
	func camera()
	func menuGallery()
	func resetPressed()
}

final class NewTaskPresenter {
	
	let vc: NewTaskViewController?
	var router: NewTaskRouterProtocol?
	
	init(vc: NewTaskViewController) {
		self.vc = vc
	}
	
}

extension NewTaskPresenter: NewTaskPresenterProtocol {
	
	func resetPressed() {
	
	}
	
	func saveTaskPressed() {
		if !(vc?.newTaskTitleTF.text?.isEmpty ?? false) && !(vc?.newTaskDescriptionTF.text?.isEmpty ?? false) {
			
			if let imageData: Data = vc?.newTaskImage.image?.jpegData(compressionQuality: 0.5) {
				
				SaveFavoritesPresenter.shared.addLocal(favorite: DownloadNewModel(pId: Int.random(in: 0..<999),
																				  pNewTask: vc?.newTaskTitleTF.text ?? "",
																				  pPriority: vc?.newTaskPriorityTF.text ?? "",
																				  pTaskDate: vc?.newTaskDateTF.text ?? "",
																				  pTaskDescription: vc?.newTaskDescriptionTF.text ?? "",
																				  pTaskCategory:vc?.newTaskCategoryTitle.text ?? "",
																				  pTaskImage: imageData))
				{ (success) in
					print("Datos Guardados Correctamente")
				} failure: { (error) in
					print("Error Al Guardar Los Datos")
				}
				
			}
		} else {
			print("Rellena todos los Campos")
		}
	}
	
	func library() {
		let imagePicker = UIImagePickerController()
		imagePicker.sourceType = .photoLibrary
		imagePicker.delegate = vc.self
		imagePicker.allowsEditing = true
		self.router?.showPicker(imagePicker: imagePicker)
	}
	
	func camera() {
		let imagePicker = UIImagePickerController()
		imagePicker.sourceType = .camera
		imagePicker.delegate = vc.self
		imagePicker.allowsEditing = true
		self.router?.showPicker(imagePicker: imagePicker)
	}
	
	func menuGallery() {
		let actionSheet = UIAlertController(title: "Selecciona una Opcion", message: nil, preferredStyle: .actionSheet)
		actionSheet.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
		actionSheet.addAction(UIAlertAction(title: "Sacar Foto", style: .default, handler: { _ in
			self.vc?.takePhotoWithCamera()
		}))
		actionSheet.addAction(UIAlertAction(title: "Escoger de la libreria de foto", style: .default, handler: { _ in
			self.vc?.choosePhotoFromLibrary()
		}))
		self.router?.showActionSheet(actionSheet: actionSheet)
	}
}
