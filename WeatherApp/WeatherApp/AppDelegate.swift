//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Zakaria El Mouatassim on 21/06/2023.
//

import UIKit
import WeatherNetworking

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "CityList", bundle: nil)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = storyboard.instantiateViewController(withIdentifier: "CityList")
        window?.makeKeyAndVisible()

        return true
    }
}

