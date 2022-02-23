//
//  SplashViewController.swift
//  GrouponForNttdata
//
//  Created by Diego Rodriguez Casillas on 23/2/22.
//

import UIKit

protocol SplashViewProtocol {
	
}

class SplashViewController: BaseViewController<SplashPresenterProtocol>, ReuseIdentifierViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension SplashViewController: SplashViewProtocol {
	
}
