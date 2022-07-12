//
//  HeaderYUView.swift
//  TossClone
//
//  Created by 송시원 on 2022/07/04.
//

import UIKit

class HeaderUIView: UIView {

    private let heroimageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
//        imageView.image
        return imageView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroimageView)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        heroimageView.frame = bounds
    }
    required init?(coder: NSCoder) {
        fatalError()
    }

}
