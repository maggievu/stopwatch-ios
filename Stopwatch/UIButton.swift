//
//  UIButton.swift
//  Stopwatch
//
//  Created by Maggie on 2019-01-21.
//  Copyright © 2019 Maggie VU. All rights reserved.
//

import UIKit
import Foundation

extension UIButton {
    open override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }
}

