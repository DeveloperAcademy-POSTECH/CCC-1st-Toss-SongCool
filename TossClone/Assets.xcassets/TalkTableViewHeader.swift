//
//  TalkTableViewHeader.swift
//  TossClone
//
//  Created by 송시원 on 2022/07/11.
//

import UIKit

class TalkTableViewHeader: UIView {
    
    private let talkHeaderImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "Toss-logo")
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        addSubview(talkHeaderImageView)
        configureConstraints()
    }
    
    private func configureConstraints() {
        let talkHeaderImageViewConstraints = [
            talkHeaderImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            talkHeaderImageView.topAnchor.constraint(equalTo: topAnchor),
            talkHeaderImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            talkHeaderImageView.heightAnchor.constraint(equalToConstant: 180)
        ]
        NSLayoutConstraint.activate(talkHeaderImageViewConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
