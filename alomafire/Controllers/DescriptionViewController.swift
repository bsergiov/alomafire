//
//  DescriptionViewController.swift
//  alomafire
//
//  Created by BSergio on 19.01.2022.
//

import UIKit
import Alamofire

class DescriptionViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet weak var signImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var luckyNumber: UILabel!
    @IBOutlet weak var luckyTime: UILabel!
    
    @IBOutlet weak var paraetrsStackView: UIStackView!
    
    // MARK: - Public Properties
    var sign: String!
    
    // MARK: - Private Properties
    var indicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showIndicator()
        setupFirstContent()
        fetchData()
        
    }
}

// MARK: - Private Methodes
extension DescriptionViewController {
    private func setupFirstContent() {
        title = sign
        signImage.image = UIImage(named: sign)
    }
    
    private func showIndicator() {
        indicator.center = view.center
        indicator.hidesWhenStopped = true
        view.addSubview(indicator)
        indicator.startAnimating()
    }
    
    private func fetchData() {
        NetworkManager.shared.fetchForacast(for: sign) { forecast in
            guard
                let description = forecast.description,
                let date = forecast.currentDate,
                let color = forecast.color,
                let luckyNumber = forecast.luckyNumber,
                let luckyTime = forecast.luckyTime
            else { return }
            self.descriptionLabel.text = description
            self.dateLabel.text = "Today \(date)"
            self.colorLabel.text = "You color: \(color)"
            self.luckyNumber.text = "You lucky number: \(luckyNumber)"
            self.luckyTime.text = "You lucky time: \(luckyTime)"
            self.indicator.stopAnimating()
            self.paraetrsStackView.isHidden = false
            self.descriptionLabel.isHidden = false
        }
    }
}
