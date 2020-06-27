//
//  AuthPermissionCoordinator.swift
//  UpcomingMovies
//
//  Created by Alonso on 6/27/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import UIKit

class AuthPermissionCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var navigationController: UINavigationController
    
    var authPermissionURL: URL?
    var presentingViewController: UIViewController!
    var authPermissionDelegate: AuthPermissionViewControllerDelegate?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = AuthPermissionViewController.instantiate()
        let viewModel = AuthPermissionViewModel(authPermissionURL: authPermissionURL)
        
        viewController.viewModel = viewModel
        viewController.delegate = authPermissionDelegate
        viewController.coordinator = self
        
        navigationController.pushViewController(viewController, animated: false)
        
        presentingViewController.present(navigationController, animated: true, completion: nil)
    }
    
    func dismiss(completion: (() -> Void)? = nil) {
        let presentedViewController = navigationController.topViewController
        presentedViewController?.dismiss(animated: true) { [weak self] in
            completion?()
            self?.parentCoordinator?.childDidFinish()
        }
    }
    
    func didDismiss() {
        parentCoordinator?.childDidFinish()
    }
    
}