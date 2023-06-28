//
//  CityListViewController.swift
//  WeatherApp
//
//  Created by Zakaria El Mouatassim on 23/06/2023.
//

import UIKit

class CityListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private let cityCellIdentifier = "CityCell"

    private lazy var viewModel: CityListViewModel = {
        return CityListViewModel()
    }()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchCities()
        self.tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CityListViewModel()
        setupTableView()
        setUpNavigation()
    }

    private func createHeaderView(withTitle title: String) -> UIView {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        headerView.backgroundColor = .clear

        let headerLabel = UILabel(frame: CGRect(x: 5, y: 0, width: tableView.frame.width, height: 30))
        headerLabel.text = title
        headerLabel.textColor = .white
        headerLabel.textAlignment = .left
        headerView.addSubview(headerLabel)

        return headerView
    }

    private func setupTableView() {
        tableView.tableHeaderView = createHeaderView(withTitle: viewModel.lastSearchText)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.layer.cornerRadius = 10
        tableView.layer.masksToBounds = true
        tableView.register(UINib(nibName: "\(CityTableViewCell.self)", bundle: nil), forCellReuseIdentifier: cityCellIdentifier)
    }

    private func setUpNavigation() {
        let plusButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
        // Add the plus button to the navigation bar
        navigationItem.rightBarButtonItem = plusButton
        navigationItem.rightBarButtonItem?.tintColor = .white
        navigationItem.title = viewModel.navigationTitle
    }

    @objc func plusButtonTapped() {
        guard let addCityVC: AddCityViewController = AppStoryBoard.instantiate(withIdentifier: "AddCity") else {
            fatalError("Unable to instantiate Add City View Controller")
        }
        navigationController?.pushViewController(addCityVC, animated: true)
    }
}

extension CityListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cities.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cityCellIdentifier, for: indexPath) as! CityTableViewCell
        cell.cityLabel?.text = viewModel.cities[indexPath.row]
        return cell
    }
}

extension CityListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailVC: DetailViewController = AppStoryBoard.instantiate(withIdentifier: "Detail") else {
            fatalError("Unable to instantiate Detail View Controller")
        }
        detailVC.viewModel = DetailViewModel(delegate: detailVC, cityName: viewModel.cities[indexPath.row])
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
