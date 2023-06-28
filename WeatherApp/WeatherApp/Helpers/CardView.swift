//
//  CardView.swift
//  WeatherApp
//
//  Created by Zakaria El Mouatassim on 24/06/2023.
//

import UIKit

@IBDesignable
class CardView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCardView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCardView()
    }

    private func setupCardView() {
        layer.cornerRadius = 5.0
        layer.masksToBounds = true

        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4.0
    }
}
