//
//  HomeViewController.swift
//  Todo
//
//  Created by Makoto on 2021/09/13.
//

import UIKit

final class HomeViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var plusAlertButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var adImageView: UIImageView!
    
    private let homeTableViewCell = "homeTableViewCell"
    private var textArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        plusAlertButton.layer.cornerRadius = 50 / 2
        plusAlertButton.layer.masksToBounds = true
        
        closeButton.layer.cornerRadius = 50 / 2
        closeButton.layer.borderWidth = 1
        closeButton.layer.masksToBounds = true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "homeTableViewCell")
    }
    
    @IBAction func plusAlert(_ sender: Any) {
        
        let alert = UIAlertController(title: "タスクの追加", message: "", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "新規タスク"
        }
        
        let plus = UIAlertAction(title: "追加", style: .default) { (action) in
            
            
        }
        
        let cancel = UIAlertAction(title: "キャンセル", style: .cancel, handler: nil)
        
        alert.addAction(plus)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func close(_ sender: Any) {
        
        
    }
    
    @IBAction func setting(_ sender: Any) {
        
        
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeTableViewCell") as! HomeTableViewCell
        
        //        let checkImageView = cell.contentView.viewWithTag(1) as! UIImageView
        //        let taskLabel = cell.contentView.viewWithTag(2) as! UILabel
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
    }
}
