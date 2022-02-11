//
//  ProfilePresenter.swift
//  AppTableViewDemo2
//
//  Created by Diego Rodriguez Casillas on 8/2/22.
//

import Foundation
import UIKit

protocol ProfilePresenterProtocol {
	func viewDidLoad()
	func getDataForRowPost() -> Int
	func getInformationProfileCell() -> ProfileModel?
	func getInformationForRowCell(indexPath: Int) -> PostModel

}

final class ProfilePresenter {
		
	let vc: ProfileViewController?
	
	var profileModel: ProfileModel? = ProfileModel()
	var postArrayModel: [PostModel] = []
	
	init(vc: ProfileViewController) {
		self.vc = vc
	}
	
}

extension ProfilePresenter: ProfilePresenterProtocol {
	
	func viewDidLoad() {
		self.getProfileData()
		self.getPostData()
		self.vc?.reloadData()
	}
	
	func getProfileData() {
		profileModel = ProfileModel(imageProfile: UIImage(named: "thor"),
									userProfile: "@Thor7",
									nameProfile: "Thor",
									worshopProfile: "Herrero",
									nationalityProfile: "Hasgard",
									numberOfFollowers: 200)
	}
	
	func getPostData() {
		postArrayModel.removeAll()
		postArrayModel = [PostModel(profileModel: ProfileModel(imageProfile: UIImage(named: "elsa"),
															  userProfile: "@Elsa",
															  nameProfile: "Elsa",
															  worshopProfile: "Actriz",
															   nationalityProfile: "Española",
															  numberOfFollowers: 300),
								   titlePost: "Vivan las pelicilas de Marvel",
								   messagePost: "Las mejores peliculas son las de THOR",
								   fontPost: "Marvel.com",
								   numberOfLikes: 100,
								   numberOfComments: 25,
								   timePost: Date(),
								   imagePost: UIImage(named: "thor&elsa"))]
	}
	
	func getDataForRowPost() -> Int {
		return postArrayModel.count
	}
	
	func getInformationProfileCell() -> ProfileModel? {
		return profileModel
	}
	
	func getInformationForRowCell(indexPath: Int) -> PostModel {
		return postArrayModel[indexPath]
	}
}
