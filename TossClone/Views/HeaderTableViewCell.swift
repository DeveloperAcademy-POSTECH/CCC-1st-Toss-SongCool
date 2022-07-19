//
//  HeaderTableViewCell.swift
//  TossClone
//
//  Created by 송시원 on 2022/07/19.
//

import UIKit
protocol HeaderTableViewCellDelegate: AnyObject {
    func HeaderTableViewCellDidTapAction()
}
class HeaderTableViewCell: UITableViewCell {
    static let identifier = "HeaderTableViewCell"

    //상단부
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "토스 뱅크"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // > 모양
    private var chevron: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        
        let image = UIImage(systemName: "chevron.forward", withConfiguration: UIImage.SymbolConfiguration(pointSize: 13, weight: .semibold))!
//        imageView.tintColor = .theme.secondary
        imageView.image = image
            
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(chevron)
        configureConstraints() // 배치관련 콘스트레인트 적용하기
    }
    

    @objc private func didTapAction(){
        // delegate?.tossTableViewCellDidTapAction()
    }
    
    private func configureConstraints() {
        let displayTitleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 12)
        ]
        let chevronConstraints = [
            chevron.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 24),
            chevron.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor)
        ]
        NSLayoutConstraint.activate(displayTitleLabelConstraints)
        NSLayoutConstraint.activate(chevronConstraints)

    }
    // 에러 메시지
    required init?(coder: NSCoder) {
        fatalError()
    }
}
