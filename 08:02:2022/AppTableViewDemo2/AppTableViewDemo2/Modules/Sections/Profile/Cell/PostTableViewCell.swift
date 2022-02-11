//
//  PostTableViewCell.swift
//  AppTableViewDemo2
//
//  Created by Diego Rodriguez Casillas on 8/2/22.
//

import UIKit

protocol PostTableViewCellProtocol {
	func configureCell(postModel: PostModel)
}

class PostTableViewCell: UITableViewCell {

	// MARK: - Outlets
	@IBOutlet weak var profileImage: UIImageView!
	@IBOutlet weak var profileName: UILabel!
	@IBOutlet weak var profilejob: UILabel!
	@IBOutlet weak var profilelastPostTime: UILabel!
	@IBOutlet weak var postDescription: UILabel!
	@IBOutlet weak var postImage: UIImageView!
	@IBOutlet weak var postName: UILabel!
	@IBOutlet weak var fontName: UILabel!
	@IBOutlet weak var postLikes: UILabel!
	@IBOutlet weak var postComments: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension PostTableViewCell: PostTableViewCellProtocol {
	internal func configureCell(postModel: PostModel) {
		self.profileImage.image = postModel.profileModel?.imageProfile
		self.profileName.text = postModel.profileModel?.userProfile
		self.profilejob.text = postModel.profileModel?.worshopProfile
		//self.profilelastPostTime.text = postModel.timePost
		self.postDescription.text = postModel.messagePost
		self.postImage.image = postModel.imagePost
		self.postName.text = postModel.titlePost
		self.fontName.text = postModel.fontPost
		self.postLikes.text = "Seguidores: \(postModel.numberOfLikes!)"
		self.postComments.text = "Comentarios: \(postModel.numberOfComments!)"

	}
}
