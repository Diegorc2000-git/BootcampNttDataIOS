//
//  ProfileCell.swift
//  POCCambioDomicilio
//
//  Created by Diego Rodriguez Casillas on 11/3/22.
//

import UIKit

protocol ProfileCellDelegate: AnyObject {
	func showInfoProfile(_ cell: UITableViewCell, showMoreInfo: Bool)
}

protocol ProfileCellProtocol {
	func configCell(model: ProfileCellModel)
}

class ProfileCell: UITableViewCell, ReuseIdentifierView {

	// MARK: - Variables
	weak var delegate: ProfileCellDelegate?
	
	// MARK: - IBOutlets
	@IBOutlet weak var backgroundGenericView: UIView!
	@IBOutlet weak var profileImage: UIImageView!
	@IBOutlet weak var infoButton: UIButton!
	@IBOutlet weak var helloLabel: UILabel!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var updateLabel: UILabel!

	@IBOutlet weak var lastNameTitle: UILabel!
	@IBOutlet weak var lastNameLabel: UILabel!

	@IBOutlet weak var nifTitle: UILabel!
	@IBOutlet weak var nifLabel: UILabel!

	@IBOutlet weak var expiredTitle: UILabel!
	@IBOutlet weak var expiredLabel: UILabel!

	@IBOutlet weak var directionTitle: UILabel!
	@IBOutlet weak var directionLabel: UILabel!

	@IBOutlet weak var cityTitle: UILabel!
	@IBOutlet weak var cityLabel: UILabel!

	// MARK: - Actions
	@IBAction func showMoreInfoProfile(_ sender: Any) {
		self.delegate?.showInfoProfile(self, showMoreInfo: true)
	}
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ProfileCell: ProfileCellProtocol {
	
	func configCell(model: ProfileCellModel) {
		
		self.helloLabel.text = model.greeting
		self.nameLabel.text = model.name
		self.updateLabel.text = model.lastUpdate
		
		self.lastNameTitle.text = model.lastNamePlaceHolder
		self.lastNameLabel.text = model.lastNameData
		self.nifTitle.text = model.identityDocPlaceHolder
		self.nifLabel.text = model.identityData
		self.expiredTitle.text = model.validityPlaceHolder
		self.expiredLabel.text = model.validityData
		self.directionTitle.text = model.addressPlaceHolder
		self.directionLabel.text = model.addressData
		self.cityTitle.text = model.cityPlaceHolder
		self.cityLabel.text = model.cityData
		
		if let data = model.photo {
			self.profileImage.image = UIImage(data: data)
		} else {
			self.profileImage.image = UIImage(named: "ico_identity_face")
		}
		self.profileImage.layer.cornerRadius = self.profileImage.bounds.width / 2
	}
	
}

struct ProfileCellModel {
	
	var photo: Data?
	var greeting: String?
	var name: String?
	var lastUpdate: String?
	var lastNamePlaceHolder: String?
	var lastNameData: String?
	var identityDocPlaceHolder: String?
	var identityData: String?
	var validityPlaceHolder: String?
	var validityData: String?
	var addressPlaceHolder: String?
	var addressData: String?
	var cityPlaceHolder: String?
	var cityData: String?
	
}
