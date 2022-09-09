//
//  CheckBoxButton.swift
//  NotBored
//
//  Created by Joaquin Gonzalo Chavez Barbaste on 09-09-22.
//

import UIKit

class CheckBoxButton: UIButton {
    // Images
    let checkedImage = UIImage(systemName: "command")
    let uncheckedImage = UIImage(systemName: "checkmark.circle")

    // Bool property
    var isChecked: Bool = false {
        didSet{
            if isChecked == true {
                self.setImage(checkedImage, for: .normal)
            } else {
                self.setImage(uncheckedImage, for: .normal)
            }
        }
    }
}
