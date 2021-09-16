//
//  Router.swift
//  Todo
//
//  Created by Makoto on 2021/09/16.
//

import UIKit

final class Router {
    
    static let shared: Router = .init()
    private init() {}
    
    private (set) var window: UIWindow?
    
    func showRoot(window: UIWindow?) {
        
        let rootVC = HomeViewController.makeFromStoryboard()
        
        window?.rootViewController = rootVC
        window?.makeKeyAndVisible()
        self.window = window
    }
    
    func showHome(from: UIViewController) {
        let vc = HomeViewController.makeFromStoryboard()
        show(from: from, next: vc)
    }
}

private extension Router {
    
    func show(from: UIViewController, next: UIViewController, animated: Bool = true) {
        if let nav = from.navigationController {
            nav.pushViewController(next, animated: animated)
        } else {
            from.present(next, animated: animated, completion: nil)
        }
    }
}
