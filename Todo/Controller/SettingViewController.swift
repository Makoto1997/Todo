//
//  SettingViewController.swift
//  Todo
//
//  Created by Makoto on 2021/09/30.
//

import UIKit

final class SettingViewController: UIViewController {
    
    static func makeFromStoryboard() -> SettingViewController {
        let vc = UIStoryboard.settingViewController
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
    }
    
    func setNavigationBar() {
        
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationItem.title = "設定"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20.0)]
    }
}
