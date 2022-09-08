//
//  LoginViewController.swift
//  NotBored
//
//  Created by Dante Cervantes on 06/09/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    private var participants = 0
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Not Bored"
        label.font = UIFont.systemFont(ofSize: 44, weight: .bold)
        label.textColor = UIColor(named: "Blue Primary")
        return label
    }()
    
    private lazy var participantsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Participants"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private lazy var participantsTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.keyboardType = .numberPad
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        textField.layer.cornerRadius = 8
        return textField
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Start", for: .normal)
        button.backgroundColor = .gray
        button.isEnabled = false
        button.layer.cornerRadius = 8
        button.addTarget(self, action:#selector(startPressed) , for: .touchUpInside)
        return button
    }()
    
    private lazy var termsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.black, for: .normal)
        let attributes: [NSAttributedString.Key: Any] = [
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        let attributeString = NSMutableAttributedString(
            string: "Terms and Conditions",
            attributes: attributes
        )
        button.setAttributedTitle(attributeString, for: .normal)
        button.addTarget(self, action: #selector(termsAndConditionPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Delegates
        participantsTextField.delegate = self
        setupView()
        setupConstraints()
    }
    
    //MARK: View Build
    private func setupView(){
        //Add views to main view of VC
        self.view.addSubview(titleLabel)
        self.view.addSubview(participantsLabel)
        self.view.addSubview(participantsTextField)
        self.view.addSubview(startButton)
        self.view.addSubview(termsButton)
        //Styles
        self.view.backgroundColor = UIColor(named: "Blue Secondary")
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            
            participantsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            participantsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            participantsLabel.topAnchor.constraint(equalTo: participantsTextField.topAnchor, constant: -40),
            
            participantsTextField.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            participantsTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            participantsTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            participantsTextField.heightAnchor.constraint(equalToConstant: 40),
            
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            startButton.heightAnchor.constraint(equalToConstant: 60),
            
            termsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            termsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            termsButton.bottomAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 60)
        ])
    }
    
    //MARK: Actions
    
    private func toggleButtonStatus(active: Bool){
        if active {
            startButton.backgroundColor = UIColor(named: "Blue Primary")
        } else {
            startButton.backgroundColor = .gray
        }
        
        startButton.isEnabled = active
    }
    
    @objc func startPressed(){
        let vc = TabBarViewController(nibName: nil, bundle: nil)
        vc.participants = participants
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
    }
    
    @objc func termsAndConditionPressed(){
        let vc = TermsAndConditionsViewController(nibName: nil, bundle: nil)
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
    }
}

//MARK: UITextFieldDelegate

extension LoginViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc private func textFieldDidChange(){
        guard participantsTextField.text?.isEmpty == false else{
            toggleButtonStatus(active: false)
            return
        }
        
        guard let participants = Int(participantsTextField.text!) else {
            return
        }
        
        self.participants = participants
        participants > 0 ? toggleButtonStatus(active: true) : toggleButtonStatus(active: false)
    }
}
