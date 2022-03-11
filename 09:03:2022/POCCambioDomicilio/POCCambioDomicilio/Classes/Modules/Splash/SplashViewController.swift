//
//  SplashViewController.swift
//  POCCambioDomicilio
//
//  Created by Diego Rodriguez Casillas on 9/3/22.
//

import UIKit

protocol SplashViewPresenterInterface: ViewPresenterInterface {
	
}

class SplashViewController: UIViewController, ViewInterface {

	// MARK: - IBOutlet
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var animatedView: UIView!
	@IBOutlet weak var backGroundView: UIView!
	@IBOutlet weak var viewHeight: NSLayoutConstraint!
	@IBOutlet weak var viewHeightImage: NSLayoutConstraint!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var subtitleLabel: UILabel!
	@IBOutlet weak var buttonContinue: UIButton!
	
	// MARK: - IBAction
	@IBAction func navigateToLogin(_ sender: Any) {
		self.presenter?.loginButtonPressed()
	}
	
	// MARK: - Variables
	var presenter: SplashPresenterViewInterface!
	var firstClick = true
	
	override func viewDidLoad() {
        super.viewDidLoad()
		setupView()
    }
	
	func setupView() {
		self.imageView.image = UIImage(named: "logo")
		
		self.animatedView.backgroundColor = CustomColor.color1.uiColor
		self.backGroundView.backgroundColor = CustomColor.color4.uiColor

		self.viewHeight.constant = 30
		
		let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(displayView))
		self.animatedView.addGestureRecognizer(gestureRecognizer)
		
		let gestureRecognizerReset = UITapGestureRecognizer(target: self, action: #selector(resetView))
		self.backGroundView.addGestureRecognizer(gestureRecognizerReset)
		
		self.subtitleLabel.isHidden = true
		
		self.buttonContinue.layer.cornerRadius = 10
		self.buttonContinue.setTitle(LocalizedKeys.Generic.genericContinueButton, for: .normal)
		self.buttonContinue.isHidden = true
		
	}
	
	@objc
	func displayView() {
		view.layoutIfNeeded()
		if firstClick {
			self.viewHeight.constant = 400
			self.titleLabel.text = LocalizedKeys.Splash.splashFirstTitleLabel
			
		} else {
			self.viewHeight.constant = 600
			self.viewHeightImage.constant = 630
			self.buttonContinue.isHidden = false
			self.subtitleLabel.isHidden = false
			
		}
		
		let options = UIView.AnimationOptions()
		
		UIView.animate(withDuration: 1.0,
					   delay: 0.5,
					   usingSpringWithDamping: 0.65,
					   initialSpringVelocity: 1.0,
					   options: options,
					   animations: {
			self.view.layoutIfNeeded()
			if !self.firstClick{
				self.titleLabel.text = LocalizedKeys.Splash.splashSecondTitleLabel
				self.subtitleLabel.text = LocalizedKeys.Splash.splashSubtitleLabel
			}
		}, completion: {
			(value: Bool) in
			self.firstClick = false
		})
	}
	
	@objc
	func resetView() {
		view.layoutIfNeeded()
		
		self.firstClick = true
		self.viewHeight.constant = 30
		self.viewHeightImage.constant = 350
		
		let options = UIView.AnimationOptions()
		
		UIView.animate(withDuration: 1.0,
					   delay: 0.5,
					   usingSpringWithDamping: 0.5,
					   initialSpringVelocity: 1.0,
					   options: options,
					   animations: {
			self.view.layoutSubviews()
		}, completion: {
			//_ in
			(value: Bool) in
		})
		
	}

}

extension SplashViewController: SplashViewPresenterInterface {
	
}
