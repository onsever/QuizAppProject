//
//  QAButton.swift
//  QuizAppProject
//
//  Created by Onurcan Sever on 2021-11-01.
//

import UIKit

class QAButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(title: String, color: UIColor) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        backgroundColor = color
        configureButton()
    }
    
    private func configureButton() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 12
        layer.borderWidth = 2
        layer.borderColor = UIColor.aqua.cgColor
        
        setTitleColor(.lightGray, for: .normal)
    }
    
}
