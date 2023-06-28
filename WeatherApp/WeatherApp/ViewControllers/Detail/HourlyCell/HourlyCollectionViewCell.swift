//
//  HourlyCollectionViewCell.swift
//  WeatherApp
//
//  Created by Zakaria El Moutassim on 24/06/2023.
//

import UIKit
import WeatherNetworking

class HourlyCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var imageWeather: UIImageView!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var cardView: GradientView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardView.layer.cornerRadius = 5.0
        cardView.layer.masksToBounds = true

        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOpacity = 0.4
        cardView.layer.shadowOffset = CGSize(width: 0, height: 2)
        cardView.layer.shadowRadius = 4.0

    }

    public func setupCell(list: List) {
        let formattedHour = DateFormatterHelper.formatDateString(list.dtTxt, fromFormat: .long, toFormat: .hourOnly)
        hourLabel.text = formattedHour
        imageWeather.image = UIImage(named: list.weather.first?.icon ?? "")
        temp.text = String(format: "%d", Int(list.main.temp))

    }

}
