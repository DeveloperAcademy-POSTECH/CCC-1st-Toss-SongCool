//
//  HomeViewController.swift
//  TossClone
//
//  Created by 송시원 on 2022/07/02.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    private let tossBank: [String] = ["토스뱅크", "모두에게드려요"]
    
    private let assets: [String] = ["자산", "KB나라사랑우대통장", "하나멤버스 주거래통장", "신한 주거래 우대통장", "입출금통장"]
    
    private let consumption: [String] = ["소비", "이번 달 쓴 금액", " 실적, 혜택도 알려드려요"]
    
    // Define the array to be used in Section.
    private let sections: [String] = ["tossBank", "assets", "consumption"]

    
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
        tableView.register(HeaderTableViewCell.self, forCellReuseIdentifier: HeaderTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)
        
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        configureNavigationBar()
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
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return tossBank.count
        } else if section == 1 {
            return assets.count
        } else {
            return consumption.count
        }
    }
    //헤더 나중에 지워야함.
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return sections[section]
//    }
    
    // 셀 어떻게 구성할지 설정.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        if indexPath.row == 0 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell") as! HeaderTableViewCell
//        } else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TossTableViewCell.identifier, for: indexPath) as? TossTableViewCell else {
                    return UITableViewCell()
            }
//            let cell = tableView.dequeueReusableCell(withIdentifier: "TossTableViewCell") as! TossTableViewCell
//        }
//        let cell = (indexPath.row == 0) ? tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell") as! HeaderTableViewCell: tableView.dequeueReusableCell(withIdentifier: "TossTableViewCell") as! TossTableViewCell

        // 선택 안되게 하는 코드
//        cell.selectionStyle = .none
//        if indexPath.row == 0 {
        if indexPath.row == 0 {
            cell.titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
            cell.avartarImageView.isHidden = true
            cell.contentLabel.isHidden = true
            cell.actionButton.isHidden = true
        }
            if indexPath.section == 0{
                cell.titleLabel.text = "\(tossBank[indexPath.row])"
            } else if indexPath.section == 1{
                cell.titleLabel.text = "\(assets[indexPath.row])"
            } else if indexPath.section == 2{
                cell.titleLabel.text = "\(consumption[indexPath.row])"
            } else {
                return UITableViewCell()
            }
//        if let 사용해서 해보기!
        
//        } else {
//            if indexPath.section == 0{
//                cell.contentsNameLabel.text = "\(tossBank[indexPath.row])"
//            } else if indexPath.section == 1{
//                cell.contentsNameLabel.text = "\(assets[indexPath.row])"
//            } else if indexPath.section == 2{
//                cell.contentsNameLabel.text = "\(consumption[indexPath.row])"
//            } else {
//                return UITableViewCell()
//            }
//        }

        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.allowsSelectionDuringEditing = false
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
