//
//  RatingControl.swift
//  FoodTracker
//
//  Created by fengxiaoyang on 2018/10/5.
//  Copyright © 2018 fenxiaoyang. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    // Mark: Properties
    private var ratingButtons = [UIButton]()
    var rating = 0
    @IBInspectable var starSize: CGSize = CGSize(width:44.0, height: 44.0)
    @IBInspectable var starCount: Int = 5

    // Mark: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    // Mark: Private Methods
    private func setupButtons() {
        for _ in 0..<starCount {
            let button = UIButton()
            button.backgroundColor = UIColor.red
            
            // add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            addArrangedSubview(button)
            
            ratingButtons.append(button)
        }
    }
    
    // Mark: Buttion Action
    func ratingButtonTapped(button: UIButton) {
        print("button pressed 👍")
    }

}
