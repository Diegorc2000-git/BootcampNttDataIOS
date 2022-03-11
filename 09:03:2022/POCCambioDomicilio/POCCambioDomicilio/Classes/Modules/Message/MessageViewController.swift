//
//  MessageViewController.swift
//  POCCambioDomicilio
//
//  Created by Diego Rodriguez Casillas on 9/3/22.
//

import UIKit

protocol MessageViewPresenterInterface: ViewPresenterInterface {
	
}

class MessageViewController: UIViewController, ViewInterface {

	var presenter: MessagePresenterViewInterface!
	
	// MARK: - IBOutlet
	@IBOutlet weak var viewContainer: UIView!
	@IBOutlet weak var titleInformation: UILabel!
	@IBOutlet weak var buttonClose: UIButton!
	@IBOutlet weak var descriptionInformation: UILabel!
	
	// MARK: - IBAction
	@IBAction func buttonClosePressed(_ sender: Any) {
		self.presenter.closeButtonPressed()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
	}

	func setupView() {
		self.viewContainer.layer.cornerRadius = 20
		
		self.titleInformation.text = LocalizedKeys.Message.messageTitleLabel
		self.titleInformation.textColor = CustomColor.color1.uiColor
		
		self.descriptionInformation.text = LocalizedKeys.Message.messageDescriptionLabel
		
	}
	
}

extension MessageViewController: MessageViewPresenterInterface {
	
}
