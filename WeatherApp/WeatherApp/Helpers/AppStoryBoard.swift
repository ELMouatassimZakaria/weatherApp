//
//  AppStoryBoard.swift
//  WeatherApp
//
//  Created by Zakaria El Mouatassim on 24/06/2023.
//

import UIKit

public class AppStoryBoard {
    static func instantiate<T: UIViewController>(withIdentifier identifier: String) -> T? {
        guard let viewController = UIStoryboard(name: identifier, bundle: .main).instantiateViewController(withIdentifier: identifier) as? T else {
            return nil
        }
        return viewController
    }
}
