//
//  AddCityViewController.swift
//  WeatherApp
//
//  Created by Zakaria El Moutassim on 23/06/2023.
//

import UIKit

class AddCityViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    private var viewModel: AddCityViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = AddCityViewModel()
       // Customize the text field
        textField.placeholder = "Entrer une nouvelle ville"
        textField.borderStyle = .roundedRect

        // Create the "Add" button
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }

    @objc func addButtonTapped() {
        guard let cityName = textField.text, !cityName.isEmpty else {
            return
        }
        viewModel.saveCity(cityName)
        // Pop the current view controller to go back to the list
        navigationController?.popViewController(animated: true)
    }
}
