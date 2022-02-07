//
//  CuartaViewController.swift
//  AppNavigation
//
//  Created by Diego Rodriguez Casillas on 4/2/22.
//

import UIKit
import MessageUI

class CuartaViewController: UIViewController {

	// MARK: - variables
	var variable = GlobalUserData()
	
	// MARK: - Outlets
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var surnameLabel: UILabel!
	@IBOutlet weak var mobileLabel: UILabel!
	@IBOutlet weak var directionLabel: UILabel!
	@IBOutlet weak var dogYearLabel: UILabel!
	@IBOutlet weak var codPostalLabel: UILabel!
	@IBOutlet weak var cityLabel: UILabel!
	@IBOutlet weak var geograficalPositionLabel: UILabel!
	@IBOutlet weak var sendEmail: UIButton!
	
	// MARK: - Outlets Actions
	@IBAction func sendEmailPressed(_ sender: Any) {
		if MFMailComposeViewController.canSendMail() {
			present(configureEmailComposeVC(), animated: true, completion: nil)
		} else {
			present(displayAlertVC(myTitle: "HEY",
								   myMessage: "No puedes enviar un Email"),
					animated: true,
					completion: nil)
		}
	}
	
	private func configureEmailComposeVC() -> MFMailComposeViewController {
		let mailComp = MFMailComposeViewController()
		mailComp.mailComposeDelegate = self
		mailComp.setToRecipients([""])
		mailComp.setSubject("")
		let emailBody = "Hola Mundo desde la app de navegation!!\n Info del Usuario\n\n Nombre: \(nameLabel.text ?? "") \n Apellido: \(surnameLabel.text ?? "") \n Teléfono: \(mobileLabel.text ?? "") \n Dirección: \(directionLabel.text ?? "") \n Edad de mi perro: \(dogYearLabel.text ?? "") \n Codigo Postal: \(codPostalLabel.text ?? "") \n Ciudad: \(cityLabel.text ?? "") \n Posicion Geografica: \(geograficalPositionLabel.text ?? "") \n"
		mailComp.setMessageBody(emailBody, isHTML: false)
		return mailComp
	}
	
	
    override func viewDidLoad() {
        super.viewDidLoad()

        showInfo()
    }

	func showInfo() {
		nameLabel.text = variable.nameData
		surnameLabel.text = variable.surnameData
		mobileLabel.text = variable.phoneData
		directionLabel.text = variable.directionsData
		dogYearLabel.text = variable.yearDogData
		codPostalLabel.text = variable.cpData
		cityLabel.text = variable.countryData
		geograficalPositionLabel.text = variable.geograficalPositionData
	}
}

extension CuartaViewController: MFMailComposeViewControllerDelegate {
	
	func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
		
		controller.dismiss(animated: true, completion: nil)
	}
}
