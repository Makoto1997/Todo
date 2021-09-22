//
//  HomeViewController.swift
//  Todo
//
//  Created by Makoto on 2021/09/13.
//

import UIKit
import GoogleMobileAds

final class HomeViewController: UIViewController {
    
    
    static func makeFromStoryboard() -> HomeViewController {
        let vc = UIStoryboard.homeViewController
        return vc
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var additionButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var adView: GADBannerView!
    
    private let homeTableViewCell = "homeTableViewCell"
    private var taskArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        additionButton.layer.cornerRadius = 50 / 2
        additionButton.layer.masksToBounds = true
        
        closeButton.layer.cornerRadius = 50 / 2
        closeButton.layer.borderWidth = 1
        closeButton.layer.masksToBounds = true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "homeTableViewCell")
        //複数選択を可能にする。
        tableView.allowsMultipleSelectionDuringEditing = true
        tableView.isEditing = true
        tableView.allowsSelectionDuringEditing = true
        
        adView.adUnitID = "ca-app-pub-6920435367310913/3187878572"
        adView.rootViewController = self
        adView.load(GADRequest())
    }
    
    @IBAction func addition(_ sender: Any) {
        
        var alertTextField: UITextField?
        let alert = UIAlertController(title: "タスクの追加", message: "", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            alertTextField = textField
            textField.placeholder = "新規タスク"
        }
        
        let addition = UIAlertAction(title: "追加", style: .default) { (action) in
            
            self.taskArray.append(alertTextField!.text!)
            self.tableView.reloadData()
        }
        
        let cancel = UIAlertAction(title: "キャンセル", style: .cancel, handler: nil)
        
        alert.addAction(addition)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func close(_ sender: Any) {
        
//        func deleteRows() {
//            guard let selectedIndexPaths = self.tableView.indexPathsForSelectedRows else {
//                return
//            }
//            // 配列の要素削除で、indexの矛盾を防ぐため、降順にソートする
//            let sortedIndexPaths =  selectedIndexPaths.sorted { $0.row > $1.row }
//            for indexPathList in sortedIndexPaths {
//                textArray.remove(at: indexPathList.row) // 選択肢のindexPathから配列の要素を削除
//            }
//            // tableViewの行を削除
//            tableView.deleteRows(at: sortedIndexPaths, with: UITableView.RowAnimation.automatic)
//        }
    }
    
    @IBAction func setting(_ sender: Any) {
        
        
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return taskArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeTableViewCell") as! HomeTableViewCell
        
        let taskLabel = cell.contentView.viewWithTag(1) as! UILabel
        taskLabel.text = taskArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        guard tableView.isEditing else { return }
//    }
//
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//
//        guard tableView.isEditing else { return }
//    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "削除"
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        guard tableView.isEditing else { return }
        taskArray.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let task = taskArray[sourceIndexPath.row]
        taskArray.remove(at: sourceIndexPath.row)
        taskArray.insert(task, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }

    func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        
        if action == #selector(copy(_:)) {
                return true
            }
        
        return false
    }

    func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) {
    }
}

extension HomeViewController: GADBannerViewDelegate {
    
    /// Tells the delegate an ad request loaded an ad.
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("adViewDidReceiveAd")
    }
    
    /// Tells the delegate an ad request failed.
    func adView(_ bannerView: GADBannerView,
                didFailToReceiveAdWithError error: GADRequestError) {
        print("adView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }
    
    /// Tells the delegate that a full-screen view will be presented in response
    /// to the user clicking on an ad.
    func adViewWillPresentScreen(_ bannerView: GADBannerView) {
        print("adViewWillPresentScreen")
    }
    
    /// Tells the delegate that the full-screen view will be dismissed.
    func adViewWillDismissScreen(_ bannerView: GADBannerView) {
        print("adViewWillDismissScreen")
    }
    
    /// Tells the delegate that the full-screen view has been dismissed.
    func adViewDidDismissScreen(_ bannerView: GADBannerView) {
        print("adViewDidDismissScreen")
    }
    
    /// Tells the delegate that a user click will open another app (such as
    /// the App Store), backgrounding the current app.
    func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
        print("adViewWillLeaveApplication")
    }
}
