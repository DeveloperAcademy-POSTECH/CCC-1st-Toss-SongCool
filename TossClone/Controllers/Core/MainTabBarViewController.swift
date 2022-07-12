//
//  ViewController.swift
//  TossClone
//
//  Created by 송시원 on 2022/06/29.
//
// https://youtu.be/Gmyl28QfXzU?t=683

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        //각각 네비게이션 컨트롤러를 설정함.
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: UpcomingViewController())
        let vc3 = UINavigationController(rootViewController: SearchViewController())
        let vc4 = UINavigationController(rootViewController: StockController())
        let vc5 = UINavigationController(rootViewController: TotalityViewController())

        // 아이콘 설정
        vc1.tabBarItem.image = UIImage(imageLiteralResourceName: "icon-home-mono")
        vc1.tabBarItem.selectedImage = UIImage(imageLiteralResourceName: "icon-home-mono") //선택시에 바뀌게도 가능함.
        vc2.tabBarItem.image = UIImage(imageLiteralResourceName: "icon-star-mono")
        vc3.tabBarItem.image = UIImage(imageLiteralResourceName: "icon-coin-mono")
        vc4.tabBarItem.image = UIImage(imageLiteralResourceName: "icon-arrow-solid-up-down-mono")
        vc5.tabBarItem.image = UIImage(imageLiteralResourceName: "icon-line-three-mono")

        // 이름 설정
        vc1.title = "홈"
        vc2.title = "혜택"
        vc3.title = "송금"
        vc4.title = "주식"
        vc5.title = "전체"

        //색설정
        tabBar.tintColor = .label
        
        //뷰 컨트롤러 설정하기.
        setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: true)
    }


}

