//
//  CustomDetailView.swift
//  NotBored
//
//  Created by Joaquin Gonzalo Chavez Barbaste on 07-09-22.
//

import UIKit

class customDetailView: UIView {
    var image: UIImage?
    var title: String?
    var value: String?
    
    required init(image: UIImage?, title: String?, value: String?) {
        self.image = image
        self.title = title
        self.value = value
        
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var customImage: UIImageView = {
        let imageView = UIImageView(image: image?.withConfiguration(UIImage.SymbolConfiguration(textStyle: .largeTitle)))
        imageView.tintColor = .black
        imageView.contentMode = .scaleToFill
        imageView.frame.size.height = 40
        imageView.frame.size.width = 40
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var customTitleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = title ?? "N/A"
        titleLabel.font = UIFont.systemFont(ofSize: 28.0)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .left
        return titleLabel
    }()
    
    private lazy var customValueLabel: UILabel = {
        let valueLabel = UILabel()
        valueLabel.text = value ?? ""
        valueLabel.font = UIFont.systemFont(ofSize: 28.0)
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.textAlignment = .right
        return valueLabel
    }()
    
    private func setupView() {
        self.addSubview(customImage)
        self.addSubview(customTitleLabel)
        self.addSubview(customValueLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            customImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            customImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            customTitleLabel.centerYAnchor.constraint(equalTo: customImage.centerYAnchor),
            customTitleLabel.leadingAnchor.constraint(equalTo: customImage.trailingAnchor, constant: 20),
            
            customValueLabel.centerYAnchor.constraint(equalTo: customImage.centerYAnchor),
            customValueLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
}
