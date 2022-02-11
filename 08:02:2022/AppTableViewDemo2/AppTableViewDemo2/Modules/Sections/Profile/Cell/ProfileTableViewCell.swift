//
//  ProfileTableViewCell.swift
//  AppTableViewDemo2
//
//  Created by Diego Rodriguez Casillas on 8/2/22.
//

import UIKit

protocol ProfileTableViewCellProtocol {
	func configureCell(model: ProfileModel)
}

class ProfileTableViewCell: UITableViewCell {

	// MARK: - Outlet
	@IBOutlet weak var imageProfile: UIImageView!
	@IBOutlet weak var userTwitterLabel: UILabel!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var workshopLabel: UILabel!
	@IBOutlet weak var nacionalityLabel: UILabel!
	@IBOutlet weak var numberOfFollowersLabel: UILabel!
	
	// MARK: - Action
	@IBAction func sendEmail(_ sender: Any) {
		
	}
	
	@IBAction func shareInfo(_ sender: Any) {
		
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

extension ProfileTableViewCell: ProfileTableViewCellProtocol {
	internal func configureCell(model: ProfileModel) {
		self.imageProfile.image = model.imageProfile
		self.userTwitterLabel.text = model.userProfile
		self.nameLabel.text = model.nameProfile
		self.workshopLabel.text = model.worshopProfile
		self.nacionalityLabel.text = model.nationalityProfile
		self.numberOfFollowersLabel.text = "Numero de seguidores: \(model.numberOfFollowers!)"
		
	}
}
