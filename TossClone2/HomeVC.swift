//
//  ViewController.swift
//  TossClone2
//
//  Created by 송시원 on 2022/07/04.
//

import UIKit

class HomeVC: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    let cellIdentifier = "bankCell"
    let cellData = ["KB은행통장","하나통장","신한 주거래 우대통장"]
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100.0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = self.homeTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = cellData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellData.count
    }
    
    @IBOutlet weak var bankName: UILabel!
    @IBOutlet weak var homeTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        homeTableView.delegate = self
        homeTableView.dataSource = self
    }
    
    
}

