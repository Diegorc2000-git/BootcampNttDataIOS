//
//  NavigationBarView.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 2/3/22.
//

import UIKit

protocol CustomNavigationBarDelegate: class {
	func leftButtonPressed(buttonItemPressed: NavigationBarButtonItem)
	func rightButtonPressed(buttonItemPressed: NavigationBarButtonItem)
	func navigationBackButtonPressed(buttonItemPressed: NavigationBarButtonItem)
}

class NavigationBarView: BaseComponent {

	@IBOutlet weak var leftButton: UIButton!
	@IBOutlet weak var rightButton: UIButton!
	@IBOutlet weak var iconCenter: UIImageView!
	@IBOutlet weak var labelTitle: UILabel!
	
	@IBOutlet weak var largeNavigationBarTitleBottomConstraints: NSLayoutConstraint!
	@IBOutlet weak var normalNavigationBarTitleBottomConstraint: NSLayoutConstraint!
	
	weak var delegate: CustomNavigationBarDelegate?
	var viewModel: NavigationBarModel?
	
	override func layoutSubviews() {
		super.layoutSubviews()
		setup()
	}
	
	override func setup() {
		super.setup()
		guard let viewModel = viewModel else { return }
		
		switch viewModel.type {
		case .customNormal:
			self.configureCustomNavBar(viewModel: viewModel)
			
		case .customLarge:
			
			self.configureLargeNavBar(viewModel: viewModel)
			
		default:
			break
		}
		self.layoutIfNeeded()
	}
	func configure(viewModel: NavigationBarModel) {
		self.viewModel = viewModel
		self.setup()
	}

	private func configureCustomNavBar(viewModel: NavigationBarModel) {
		self.largeNavigationBarTitleBottomConstraints.isActive = false
		self.normalNavigationBarTitleBottomConstraint.isActive = true
		leftButton.isHidden = false
		if let arrayLeftButton = viewModel.arrayLeftButtons {
			leftButton.setImage(arrayLeftButton.first?.image, for: .normal)
			
		}
		rightButton.isHidden = false
		if let arrayRightButton = viewModel.arrayRightButtons {
			rightButton.setImage(arrayRightButton.first?.image, for: .normal)
		}
		
		iconCenter.isHidden = false
		iconCenter.image = viewModel.iconCenter
		labelTitle.isHidden = true
	}
	
	private func configureLargeNavBar(viewModel: NavigationBarModel) {
//		self.normalNavigationBarTitleBottomConstraint.isActive = false
		self.largeNavigationBarTitleBottomConstraints.isActive = true
	   
		leftButton.isHidden = false
		if let arrayLeftButton = viewModel.arrayLeftButtons {
			leftButton.setImage(arrayLeftButton.first?.image, for: .normal)
			leftButton.tintColor = .black
		}
	   
		rightButton.isHidden = true
		if let rightButtonModel = viewModel.arrayRightButtons?.first {
			rightButton.isHidden = false
			rightButton.tintColor = .black
			switch rightButtonModel.resourceType {
			case .freeText:
				rightButton.setTitle(rightButtonModel.text?.uppercased(), for: .normal)
			case .image:
				rightButton.setImage(rightButtonModel.image, for: .normal)

			}
			rightButton.tintColor = .black
		}
		
		iconCenter.isHidden = true
		labelTitle.isHidden = false
		labelTitle.text = viewModel.title
		labelTitle.textColor = .black
		self.labelTitle.text = viewModel.title
	}
	
//	@IBAction func rightButtonPressed(_ sender: Any) {
//		if let arrayRightButtons = viewModel?.arrayRightButtons {
//			self.delegate?.rightButtonPressed(buttonItemPressed: arrayRightButtons.first ?? .cancelButton)
//		}
//	}
//
//	@IBAction func leftButtonPressed(_ sender: Any) {
//
//		if let arrayLeftButtons = viewModel?.arrayLeftButtons {
//			self.delegate?.leftButtonPressed(buttonItemPressed: arrayLeftButtons.first ?? .backArrow)
//		}
//		if let backNavigation = viewModel?.backButton {
//			self.delegate?.navigationBackButtonPressed(buttonItemPressed: backNavigation)
//		}
//
//	}
}
