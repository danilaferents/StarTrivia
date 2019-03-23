//
//  BlackBgView.swift
//  StarTrivia
//
//  Created by Мой Господин on 24/03/2019.
//  Copyright © 2019 Danila Ferents. All rights reserved.
//

import UIKit

class BlackBgView: UIView {
    override func awakeFromNib() {
        layer.backgroundColor = BLACK_BG
        layer.cornerRadius = 10
    }
}

class BlackBgButton: UIButton {
    override func awakeFromNib() {
        layer.backgroundColor = BLACK_BG
        layer.cornerRadius = 10
    }
}
