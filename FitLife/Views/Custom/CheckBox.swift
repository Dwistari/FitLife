//
//  CheckBox.swift
//  FitLife
//
//  Created by Dwistari on 18/08/24.
//

import UIKit

class CheckBox: UIButton {
    
    let checkedImage = UIImage(named: "ic_check_box")
    let uncheckedImage = UIImage(named: "ic_check_box_outline_blank")
    
    // Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    
    private func commonInit() {
        self.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
        updateImage()
    }
    
    // Update the button image based on the isChecked property
    private func updateImage() {
        let image = isChecked ? checkedImage : uncheckedImage
        self.setImage(image, for: .normal)
    }
    
    // Bool property
    var isChecked: Bool = false {
        didSet {
            if isChecked == true {
                self.setImage(checkedImage, for: UIControl.State.normal)
            } else {
                self.setImage(uncheckedImage, for: UIControl.State.normal)
            }
        }
    }
    
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }
}
