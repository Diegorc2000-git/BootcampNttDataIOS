//
//  StartViewController.swift
//  AppPart4
//
//  Created by Diego Rodriguez Casillas on 10/2/22.
//

import UIKit

class StartViewController: UIViewController {

	var presenter: StartPresenterProtocol?
	
	// MARK: - Outlet

	// MARK: - Outlet Action
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.title = "HOME"
		
		setupBackground()
		setupView()
    }

	func setupBackground() {
		let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
		backgroundImage.image = UIImage(named: "backgroundLogin&SignUp")
		backgroundImage.contentMode = UIView.ContentMode.scaleToFill
		self.view.insertSubview(backgroundImage, at: 0)
	}
	func setupView() {
		navigationController?.isNavigationBarHidden = false
		tabBarController?.tabBar.isHidden = false
	
	}
	
}
