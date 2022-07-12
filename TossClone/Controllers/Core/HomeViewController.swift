//
//  HomeViewController.swift
//  TossClone
//
//  Created by 송시원 on 2022/07/02.
//

import UIKit

class HomeViewController: UIViewController {
    
    //네비게이션 바 영역
    private func configureNavigationBar() {
        let size: CGFloat = 22
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 90, height: size))
        logoImageView.contentMode = .scaleAspectFill
        logoImageView.image = UIImage(named: "Toss-logo")

        let middleView = UIView(frame: CGRect(x: 0, y: 0, width: 90, height: size))
        middleView.addSubview(logoImageView)
        navigationItem.largeTitleDisplayMode = .always

        navigationItem.titleView = middleView
//        let tossImage = UIImage(named: "Toss-logo")
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: tossImage, style: .plain, target: self, action: #selector(didTapTalk))
        
        let talkImage = UIImage(named: "icon-chat-bubble-mono")
        //이부분 섭뷰로 묶을까? 아님 따로 두나?
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: talkImage, style: .plain, target: self, action: #selector(didTapTalk))
    }
    
    @objc private func didTapTalk() {
        print("pressed talk")
        let vc = TalkViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private let homeFeedTable: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(TossTableViewCell.self, forCellReuseIdentifier: TossTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)
        
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        configureNavigationBar()
        
//        let headerView = HeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
//        homeFeedTable.tableHeaderView = headerView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.frame
        
    }


}

// 이 뷰에서 테이블 뷰로 사용하기 좋도록 프로토콜을 세팅하는데, 위에 다적으면 코드가 길어지니까 분리함.
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    // 총 몇개의 섹션으로 나뉘는가?
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // 셀 어떻게 구성할지 설정.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: TossTableViewCell.identifier, for: indexPath) as? TossTableViewCell else {
            return UITableViewCell()
        }
//        cell.delegate = self
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 200
//    } // 강제 높이설정
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 40
//    }
    
}

extension HomeViewController: TossTableViewCellDelegate {
    func tossTableViewCellDidTap() {
        print("tap")
    }
    
    func tossTableViewCellDidTapAction() {
        print("송금")
    }
    
    
}
