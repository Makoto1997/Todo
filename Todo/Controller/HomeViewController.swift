//
//  HomeViewController.swift
//  Todo
//
//  Created by Makoto on 2021/09/13.
//

import UIKit

final class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var adImageView: UIImageView!
    
    private let homeTableViewCell = "homeTableViewCell"
    private var textArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "homeTableViewCell")
    }
    
    @IBAction func plus(_ sender: Any) {
        
        
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
        
        return cell
    }
}
