//
//  TermsAndConditionsViewController.swift
//  NotBored
//
//  Created by Dante Cervantes on 07/09/22.
//

import UIKit

class TermsAndConditionsViewController: UIViewController {
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "close"), for: .normal)
        button.addTarget(self, action: #selector(closePressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var termsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Terms and conditions"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private lazy var contentView: UIView = {
        let content = UIView()
        content.translatesAutoresizingMaskIntoConstraints = false
        return content
    }()
    
    private lazy var appLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Not Bored"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textColor = UIColor(named: "Blue Primary")
        label.textAlignment = .center
        return label
    }()
    
    private lazy var conditionsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = """
                        Lorem ipsum dolor sit amet consectetur adipiscing elit inceptos ridiculus iaculis, nullam ligula elementum duis tellus maecenas nec fermentum sed dictum laoreet, taciti donec habitant quam purus ultricies porta posuere sociis. Cubilia senectus netus integer tempor dignissim viverra nostra tellus scelerisque aliquet, semper penatibus tempus sociosqu class sociis bibendum justo etiam, rutrum aenean et eget pretium volutpat eu dictum dictumst.

                        Praesent gravida ridiculus cursus luctus maecenas in libero mi interdum, auctor ullamcorper eget nam eros condimentum litora tristique erat, fusce rhoncus mauris cras aptent non et ultricies. Iaculis porttitor etiam pulvinar proin fringilla ad, sem ornare sociosqu ultrices litora himenaeos egestas, eros laoreet mauris leo porta. Nibh interdum facilisis dapibus magnis phasellus tortor fusce nostra quam, ante non elementum himenaeos id hac et hendrerit eros, dui at sollicitudin turpis viverra molestie cras quis.

                        Dignissim faucibus auctor in vitae porttitor tellus nascetur tempor sociosqu, elementum dis ultricies eu tempus tincidunt lectus posuere, et ac interdum commodo montes convallis curae facilisis. Vitae diam phasellus litora ad aenean himenaeos, magnis malesuada nec metus faucibus, turpis mollis hac lacinia lacus. Condimentum dis in sed vel molestie integer, gravida eget volutpat interdum bibendum scelerisque magnis, penatibus non sollicitudin convallis egestas. Aptent mi ligula conubia justo habitant cubilia tellus curabitur, a nisi integer non eget vivamus cursus hac, lacus rutrum ridiculus tempor litora nostra dis.

                        Nisl pulvinar taciti tellus diam quam dictum cursus potenti euismod natoque feugiat mattis ornare tortor, aliquam orci dapibus inceptos id egestas ante viverra donec aptent suscipit nulla. Eget nisl fringilla cras felis maecenas nisi ridiculus id conubia hac primis sem ullamcorper porttitor, rutrum ac sodales ultrices vestibulum cum leo semper fusce porta eu fermentum. Proin nisi suspendisse class facilisi curabitur quisque, fusce vulputate semper a nulla velit, duis in orci faucibus turpis. Risus metus magnis aliquam accumsan laoreet congue per, tempus purus et odio senectus sodales vulputate, ligula malesuada dis habitasse nullam pellentesque.
                    """
        label.textAlignment = .justified
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    //MARK: View Build
    private func setupView(){
        //Add views to main view of VC
        self.view.addSubview(closeButton)
        self.view.addSubview(termsLabel)
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(appLabel)
        contentView.addSubview(conditionsLabel)
        
        //Styles
        self.view.backgroundColor = UIColor(named: "Blue Secondary")
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            termsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            termsLabel.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 20),
            
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.topAnchor.constraint(equalTo: termsLabel.topAnchor, constant: 40),
            
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            
            appLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            appLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            appLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            
            conditionsLabel.topAnchor.constraint(equalTo: appLabel.topAnchor, constant: 50),
            conditionsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            conditionsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            conditionsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
    //MARK: Actions
    
    @objc private func closePressed(){
        self.dismiss(animated: true)
    }
}
