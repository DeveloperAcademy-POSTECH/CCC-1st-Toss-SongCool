//
//  TalkViewController.swift
//  TossClone
//
//  Created by 송시원 on 2022/07/11.
//

import UIKit

class TalkViewController: UIViewController {

    private let talkTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TossTableViewCell.self, forCellReuseIdentifier: TossTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Talk"
        // Do any additional setup after loading the view.
        view.addSubview(talkTableView)
        
        let headerView = TalkTableViewHeader(frame: CGRect(x: 0, y: 0, width: talkTableView.frame.width, height: 380))
        
        talkTableView.delegate = self
        talkTableView.dataSource = self
        talkTableView.tableHeaderView = headerView
        configureConstraints()
    }
    
    private func configureConstraints() {
        let talkTableViewConstraints = [
            talkTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            talkTableView.topAnchor.constraint(equalTo: view.topAnchor),
            talkTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            talkTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(talkTableViewConstraints)
    }
}

extension TalkViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TossTableViewCell.identifier, for: indexPath) as? TossTableViewCell else{
            return UITableViewCell()
        }
        return cell
    }
}
