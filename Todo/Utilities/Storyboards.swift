//
//  Storyboards.swift
//  Todo
//
//  Created by Makoto on 2021/09/16.
//

import UIKit

extension UIStoryboard {
    
    static var homeViewController: HomeViewController {
        UIStoryboard.init(name: "Home", bundle: nil).instantiateInitialViewController() as! HomeViewController
    }
    
    static var settingViewController: SettingViewController {
        UIStoryboard.init(name: "Setting", bundle: nil).instantiateInitialViewController() as! SettingViewController
    }
}
