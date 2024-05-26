//
//   UIStackView+Ex.swift
//  VerbMemoryGame
//
//  Created by Maksims Šalajevs on 25/05/2024.
//

import UIKit


extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { view in
            addArrangedSubview(view)
        }
    }
}
