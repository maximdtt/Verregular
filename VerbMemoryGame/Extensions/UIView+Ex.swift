//
//  UIView+Ex.swift
//  VerbMemoryGame
//
//  Created by Maksims Šalajevs on 25/05/2024.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { view in
            addSubview(view)
        }
    }
}
