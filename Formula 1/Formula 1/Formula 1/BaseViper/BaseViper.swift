//
//  BaseViper.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 1/3/22.
//

//import Foundation
//import UIKit
//
//class BaseViewController<P>: UIViewController {
//
//	var presenter: P?
//
//}
//
//class BasePresenter<V, R, I> {
//
//	var vc: V?
//	var router: R?
//	var interactor: I?
//
//	convenience init(vc: V, router: R? = nil, interactor: I? = nil) {
//		self.init()
//		self.vc = vc
//		self.router = router
//		self.interactor = interactor
//	}
//
//}
//
//class BaseInteractor<P> {
//
//	var presenter: P?
//
//	convenience init(presenter: P) {
//		self.init()
//		self.presenter = presenter
//	}
//
//}
//
//class BaseRouter<P> {
//
//	var presenter: P?
//	var viewController: UIViewController?
//
//	convenience init(presenter: P? = nil, view: UIViewController? = nil) {
//		self.init()
//		self.presenter = presenter
//		self.viewController = view
//	}
//	func push(vc: UIViewController) {
//		if let navVC = self.viewController?.navigationController {
//			navVC.pushViewController(vc, animated: true)
//		}
//	}
//	func present(vc: UIViewController) {
//		DispatchQueue.main.async {
//			self.viewController?.present(vc, animated: true, completion: nil)
//		}
//	}
//	func popView() {
//		if let navVC = self.viewController?.navigationController {
//			DispatchQueue.main.async {
//				navVC.popViewController(animated: true)
//			}
//		}
//	}
//	func dismiss() {
//		_ = self.viewController?.dismiss(animated: true, completion: nil)
//	}
//
//}
//
//class BaseNavigation: UINavigationController {
//
//	override func viewDidLoad() {
//		super.viewDidLoad()
//	}
//
//}
