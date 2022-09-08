//
//  ActivityDetailViewController.swift
//  NotBored
//
//  Created by Joaquin Gonzalo Chavez Barbaste on 06-09-22.
//

import UIKit

class ActivityDetailViewController: UIViewController {
    let apiServices = ApiServices()
    var selectedType: String? = "Test Activity"
    var apiResponse: ApiResponse?
    
    private lazy var activityTitleLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.text = apiResponse?.activity ?? "Not found"
        aLabel.textColor = .black
        aLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        aLabel.textAlignment = .center
        return aLabel
    }()
    private lazy var participantsDetailView: customDetailView = {
        let detailView = customDetailView(image: UIImage(systemName: "person.fill"), title: "Participants", value: String(apiResponse?.participants ?? 0))
        detailView.translatesAutoresizingMaskIntoConstraints = false
        return detailView
    }()
    
    private lazy var priceDetailView: customDetailView = {
        var valueString: String? = nil
        
        if let price = apiResponse?.price {
            switch price {
            case 0:
                valueString = "Free"
                break
            case ...0.3:
                valueString = "Medium"
            default:
                valueString = "High"
            }
        }
        
        let detailView = customDetailView(image: UIImage(systemName: "dollarsign.circle"), title: "Price", value: String(valueString ?? "N/A"))
        detailView.translatesAutoresizingMaskIntoConstraints = false
        return detailView
    }()
    
    private lazy var typeDetailView: customDetailView = {
        let detailView = customDetailView(image: UIImage(systemName: "list.bullet"), title: apiResponse?.type, value: nil)
        detailView.translatesAutoresizingMaskIntoConstraints = false
        return detailView
    }()
    
    private lazy var tryAnotherButton: UIButton = {
        let aButton = UIButton()
        aButton.translatesAutoresizingMaskIntoConstraints = false
        aButton.backgroundColor = UIColor(named: "Blue Primary")
        aButton.setTitle("Try Another", for: .normal)
        aButton.layer.cornerRadius = 8
        
        return aButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let title = apiResponse?.type {
            self.title = title
        }
        
        requestActivity()
        
        tryAnotherButton.addTarget(self, action: #selector(requestActivity), for: .touchDown)
        
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        self.view.backgroundColor = UIColor(named: "Blue Secondary")
        
        self.view.addSubview(activityTitleLabel)
        self.view.addSubview(participantsDetailView)
        self.view.addSubview(priceDetailView)
        self.view.addSubview(typeDetailView)
        self.view.addSubview(tryAnotherButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            activityTitleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 40),
            activityTitleLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            activityTitleLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            
            participantsDetailView.topAnchor.constraint(equalTo: activityTitleLabel.bottomAnchor, constant: 80),
            participantsDetailView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            participantsDetailView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            
            priceDetailView.topAnchor.constraint(equalTo: participantsDetailView.bottomAnchor, constant: 80),
            priceDetailView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            priceDetailView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            
            typeDetailView.topAnchor.constraint(equalTo: priceDetailView.bottomAnchor, constant: 80),
            typeDetailView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            typeDetailView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            
            tryAnotherButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -80),
            tryAnotherButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            tryAnotherButton.heightAnchor.constraint(equalToConstant: 60),
            tryAnotherButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -40)
        ])
    }
    
    @objc private func requestActivity() {
        if let selectedType = selectedType {
            apiResponse = apiServices.activityRequest(type: selectedType)
        }
        
    }
}
