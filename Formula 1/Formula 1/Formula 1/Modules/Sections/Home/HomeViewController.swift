//
//  HomeViewController.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 1/3/22.
//

import UIKit

protocol HomeViewProtocol: BaseViewProtocol {
	func setNavigationBar(title: String)
}

class HomeViewController: BaseView {

	private var presenter: HomePresenterProtocol? { return super.basePresenter as? HomePresenterProtocol }
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	override func navigationBarRightButtonItemPressed(buttonItem: NavigationBarButtonItem) {
		super.navigationBarRightButtonItemPressed(buttonItem: buttonItem)
		
		if buttonItem.type == .information {
			self.presenter?.informationButtonPressed()
		}
	}

	func setNavigationBar(title: String) {
		self.navigationBarManager?.configureCustomNavigationBar(model: NavigationBarModel(title: title, arrayRightButtons: [.information], backGroundColor: CustomColor.viewPrimary.uiColor, isTransparent: false))
	}
}

extension HomeViewController: HomeViewProtocol {
	
}
