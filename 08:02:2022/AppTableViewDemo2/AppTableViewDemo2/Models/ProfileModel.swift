//
//  ProfileModel.swift
//  AppTableViewDemo2
//
//  Created by Diego Rodriguez Casillas on 8/2/22.
//

import Foundation
import UIKit

struct ProfileModel {
	var imageProfile: UIImage?
	var userProfile: String?
	var nameProfile: String?
	var worshopProfile: String?
	var nationalityProfile: String?
	var numberOfFollowers: Int?
	
}

struct PostModel {
	var profileModel: ProfileModel?
	var titlePost: String?
	var messagePost: String?
	var fontPost: String?
	var numberOfLikes: Int?
	var numberOfComments: Int?
	var timePost: Date?
	var imagePost: UIImage?
	
}
