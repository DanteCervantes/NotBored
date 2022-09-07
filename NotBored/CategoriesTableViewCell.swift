//
//  CategoriesTableViewCell.swift
//  NotBored
//
//  Created by Nicolas Alejandro Ferrero on 06/09/2022.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {

    var data: String? {
        didSet {
            if let data = data {
                nameLabel.text = data.capitalized
            }
        }
    }
    
    static var cellIdentifier = "categoriesCell"
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let arrowButton: UIButton = {
        let btn = UIButton()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 25, weight: .bold, scale: .large)
        btn.setImage(UIImage(systemName: "chevron.right", withConfiguration: largeConfig), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tintColor = .black
        return btn
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(named: "Blue Secondary")
        contentView.addSubview(nameLabel)
        contentView.addSubview(arrowButton)
        NSLayoutConstraint.activate([
            //Category label constraints
            nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 30),
            nameLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            //Arrow button constraints
            arrowButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -30),
            arrowButton.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
        ])
     }

     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
