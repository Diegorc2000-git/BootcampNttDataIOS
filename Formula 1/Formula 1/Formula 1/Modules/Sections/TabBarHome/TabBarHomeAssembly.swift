//
//  TabBarHomeAssembly.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 1/3/22.
//

import Foundation
import UIKit

class TabBarHomeAssembly {
	
	static func view() -> UITabBarController {
		let tabBarViewController = TabBarHomeViewController()
	
		let homeVc = HomeAssembly.navigationController()
		let homeButton = UITabBarItem(
			title: "Latest",
			image: UIImage(named: "Latest")?.withRenderingMode(.alwaysOriginal),
			selectedImage: UIImage(named: "Latest")?.withRenderingMode(.alwaysOriginal))
		
		homeVc.tabBarItem = homeButton
		
		let videoVc = VideoAssembly.navigation()
		let videoButton = UITabBarItem(
			title: "Video",
			image: UIImage(named: "Video")?.withRenderingMode(.alwaysOriginal),
			selectedImage: UIImage(named: "Video")?.withRenderingMode(.alwaysOriginal))
		
		videoVc.tabBarItem = videoButton
		
		let racingVc = RacingAssembly.navigation()
		let racingButton = UITabBarItem(title: "Racing",
										image: UIImage(named: "Racing")?.withRenderingMode(.alwaysOriginal),
										selectedImage: UIImage(named: "Racing")?.withRenderingMode(.alwaysOriginal))

		racingVc.tabBarItem = racingButton
		
		let standingVc = StandingAssembly.navigation()
		let standingButton = UITabBarItem(title: "Standing",
										image: UIImage(named: "Standing")?.withRenderingMode(.alwaysOriginal),
										selectedImage: UIImage(named: "Standing")?.withRenderingMode(.alwaysOriginal))

		standingVc.tabBarItem = standingButton
		
		let profileVc = ProfileAssembly.navigation()
		let profileButton = UITabBarItem(title: "Profile",
										image: UIImage(named: "Profile")?.withRenderingMode(.alwaysOriginal),
										selectedImage: UIImage(named: "Profile")?.withRenderingMode(.alwaysOriginal))

		profileVc.tabBarItem = profileButton
		
		tabBarViewController.viewControllers = [homeVc, videoVc, racingVc, standingVc, profileVc]
		
		return tabBarViewController
	}
}
