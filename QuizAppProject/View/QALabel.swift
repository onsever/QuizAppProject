//
//  QALabel.swift
//  QuizAppProject
//
//  Created by Onurcan Sever on 2021-11-01.
//

import UIKit

class QALabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(labelTitle: String, numberOfLines: Int, fontSize: CGFloat) {
        super.init(frame: .zero)
        text = labelTitle
        self.numberOfLines = numberOfLines
        font = .systemFont(ofSize: fontSize, weight: .semibold)
        configureLabel()
    }
    
    private func configureLabel() {
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .center
        textColor = .white
        adjustsFontSizeToFitWidth = true
    }

}
