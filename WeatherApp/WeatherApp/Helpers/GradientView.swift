//
//  GradientView.swift
//  WeatherApp
//
//  Created by Zakaria El Mouatassim on 24/06/2023.
//

import UIKit

@IBDesignable
public class GradientView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGradient()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupGradient()
    }

    private func setupGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor(red: 0.22, green: 0.33, blue: 0.53, alpha: 1.0).cgColor, UIColor(red: 0.12, green: 0.20, blue: 0.38, alpha: 1.0).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        layer.insertSublayer(gradientLayer, at: 0)

    }
}
