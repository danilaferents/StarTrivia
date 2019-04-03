//
//  FadeEnabledBt.swift
//  StarTrivia
//
//  Created by Мой Господин on 31/03/2019.
//  Copyright © 2019 Danila Ferents. All rights reserved.
//

import UIKit

class FadeENabledBt: UIButton {
    override var isEnabled: Bool {
        didSet{
            if isEnabled {
                UIView.animate(withDuration: 0.2) {
                self.alpha = 1.0
                }
            } else {
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 0.5
                }
            }
        }
    }
}
