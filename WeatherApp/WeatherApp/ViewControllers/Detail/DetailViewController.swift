//
//  DetailViewController.swift
//  WeatherApp
//
//  Created by Zakaria El Mouatassim on 24/06/2023.
//

import UIKit
import WeatherNetworking

class DetailViewController: UIViewController {
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var hourlyCollectionView: UICollectionView!
    @IBOutlet var cityName: UILabel!
    @IBOutlet var temp: UILabel!
    @IBOutlet var weatherState: UILabel!
    @IBOutlet var tempMin: UILabel!
    @IBOutlet var tempMax: UILabel!

    var viewModel: DetailViewModel!

    public var items: [List] = [] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.hourlyCollectionView.reloadData()
            }
        }
    }

    private lazy var layout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        return flowLayout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        viewModel.fetchWeatherData()
        spinner.hidesWhenStopped = true
    }

    private func setupWeather() {
        guard let firstItem = items.first else {
            return
        }
        cityName.text = viewModel.cityName
        temp.text = String(describing: Int(firstItem.main.temp))
        weatherState.text = firstItem.weather.first?.description
        tempMax.text = String(describing: Int(firstItem.main.tempMax))
        tempMin.text = String(describing: Int(firstItem.main.tempMin))
    }

    private func setupCollectionView() {
        hourlyCollectionView.collectionViewLayout = layout
        hourlyCollectionView.dataSource = self
        hourlyCollectionView.delegate = self

        let nib = UINib(nibName: "\(HourlyCollectionViewCell.self)", bundle: nil)
        hourlyCollectionView.register(nib, forCellWithReuseIdentifier: "HourlyCell")

    }
}

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HourlyCell", for: indexPath) as! HourlyCollectionViewCell
        let list = items[indexPath.row]
        cell.setupCell(list: list)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 126)
    }
}

extension DetailViewController: DetailViewModelDelegate {
    func willMakeRequest() {
        spinner.startAnimating()
    }

    func didMakeSuccessfullRequest(result: WeatherResponse) {
        items = result.list
        DispatchQueue.main.async { [weak self] in
            self?.spinner.stopAnimating()
            self?.hourlyCollectionView.reloadData()
            self?.setupWeather()
        }
    }

    func didFinishRequestWithError(error: Error) {
        DispatchQueue.main.async { [weak self] in
            self?.spinner.stopAnimating()
        }
    }
}
