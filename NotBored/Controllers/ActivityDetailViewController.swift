//
//  ActivityDetailViewController.swift
//  NotBored
//
//  Created by Joaquin Gonzalo Chavez Barbaste on 06-09-22.
//

import UIKit

class ActivityDetailViewController: UIViewController {
    var selectedType: Category?
    var selectedParticipants: Int?
    var activity: Activity?
    var isRandomlySelected: Bool = false
    
    private lazy var activityTitleLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.numberOfLines = 0
        aLabel.adjustsFontSizeToFitWidth = true
        aLabel.minimumScaleFactor = 0.2
        aLabel.text = activity?.activity ?? "Not found"
        aLabel.textColor = .black
        aLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        aLabel.textAlignment = .center
        return aLabel
    }()
    private lazy var participantsDetailView: customDetailView = {
        let detailView = customDetailView(image: UIImage(systemName: "person.fill"), title: "Participants", value: String(activity?.participants ?? 0))
        detailView.translatesAutoresizingMaskIntoConstraints = false
        return detailView
    }()
    
    private lazy var priceDetailView: customDetailView = {
        
        let detailView = customDetailView(image: UIImage(systemName: "dollarsign.circle"), title: "Price", value: activity?.priceToString ?? "N/A")
        detailView.translatesAutoresizingMaskIntoConstraints = false
        return detailView
    }()
    
    private lazy var typeDetailView: customDetailView = {
        let detailView = customDetailView(image: UIImage(systemName: "list.bullet"), title: activity?.type.rawValue.capitalized, value: nil)
        detailView.translatesAutoresizingMaskIntoConstraints = false
        detailView.isHidden = true
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(false, animated: true)
        requestActivity()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Random"
        if let titleType = selectedType?.rawValue {
            self.title = titleType.capitalized
        }
        
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
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
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
            
            tryAnotherButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
            tryAnotherButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            tryAnotherButton.heightAnchor.constraint(equalToConstant: 60),
            tryAnotherButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -40)
        ])
    }
    
    @objc private func requestActivity() {
        ApiCaller.shared.getActivity(participants: selectedParticipants, price: nil, type: selectedType) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.activityTitleLabel.text = data.activity
                    self.participantsDetailView.value = String(data.participants)
                    self.priceDetailView.value = data.priceToString
                    print(self.isRandomlySelected)
                    if self.isRandomlySelected {
                        self.typeDetailView.isHidden = false
                        self.typeDetailView.title = data.type.rawValue.capitalized
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    //Create new Alert
                    let dialogMessage = UIAlertController(title: "Error", message: "No se encontró una actividad con sus preferencias", preferredStyle: .alert)
                    
                    // Create OK button with action handler
                    let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                        self.navigationController?.popViewController(animated: true)
                    })
                    //Add OK button to a dialog message
                    dialogMessage.addAction(ok)
                    // Present Alert to
                    self.present(dialogMessage, animated: true, completion: nil)
                }
            }
        }
    }
}
