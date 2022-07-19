//
//  CollectionViewTableViewCell.swift
//  TossClone
//
//  Created by 송시원 on 2022/07/02.
//

// 뷰는 썹뷰를 짜는 곳인가?
// 컨트롤러는 그 썹뷰들을 한곳에 모아두는 곳이고?
import UIKit

protocol TossTableViewCellDelegate: AnyObject {
    func tossTableViewCellDidTapAction()
}

class TossTableViewCell: UITableViewCell {
    
    static let identifier = "TossTableViewCell"
    
//    week var delegate: TossTableViewCellDelegate?
    
    // UI 선언. 아바타를 섹터로 바꾸기.
    let avartarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "circle.circle")
        imageView.backgroundColor = .systemCyan
        return imageView
    }()
    //하단부
    var titleLabel : UILabel = {
        let label = UILabel()
        label.text = "KB국민 주거래통장"
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var contentLabel : UILabel = {
        let label = UILabel()
        label.text = "1,000 원"
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let actionButton : UIButton = {
        let button = UIButton(type: .system)
        // Define the size of the button
        let width: CGFloat = 300
        let height: CGFloat = 100
        
        button.frame = CGRect(x: 0, y: 0, width: width, height: height)
        button.setTitle("송금", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.tintColor = .label
        button.backgroundColor = .secondarySystemBackground
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .regular)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(avartarImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(contentLabel)
        contentView.addSubview(actionButton)
        configureConstraints() // 배치관련 콘스트레인트 적용하기
        configureButtons() // 버튼 액션설정한것들 적용하기
    }
    
    // 이 함수는 오브젝티브씨로 만듦.. 왜?
    @objc private func didTapAction(){
//        delegate?.tossTableViewCellDidTapAction()
    }
    private func configureButtons() {
        actionButton.addTarget(self, action: #selector(didTapAction), for: .touchUpInside)
    }
    
    // 전역 오토레이아웃 설정부부
    private func configureConstraints() {
        

        let avartarImageViewConstraints = [
            avartarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            avartarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32),
            avartarImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -34),

            // 사이즈설정, 40이고, 코너반지름 20니까 원임.
            avartarImageView.heightAnchor.constraint(equalToConstant: 40),
            avartarImageView.widthAnchor.constraint(equalToConstant: 40)
        ]
        let contentsNameLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: avartarImageView.trailingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: avartarImageView.topAnchor),
        ]
        let contentLabelConstraints = [
            contentLabel.leadingAnchor.constraint(equalTo: avartarImageView.trailingAnchor, constant: 16),
            contentLabel.topAnchor.constraint(equalTo: avartarImageView.centerYAnchor),
        ]
        let actionButtonConstraints = [
            actionButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            actionButton.centerYAnchor.constraint(equalTo: avartarImageView.centerYAnchor),
        ]
        
        NSLayoutConstraint.activate(avartarImageViewConstraints)
        NSLayoutConstraint.activate(contentsNameLabelConstraints)
        NSLayoutConstraint.activate(contentLabelConstraints)
        NSLayoutConstraint.activate(actionButtonConstraints)
    }
    
    // 에러 메시지
    required init?(coder: NSCoder) {
        fatalError()
    }
}
