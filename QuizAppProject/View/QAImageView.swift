//
//  QAImageView.swift
//  QuizAppProject
//
//  Created by Onurcan Sever on 2021-11-01.
//

import UIKit

class QAImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(image: String) {
        super.init(frame: .zero)
        configureImageView()
        self.image = UIImage(named: image)
    }
    
    init() {
        super.init(frame: .zero)
        configureImageView()
    }
    
    private func configureImageView() {
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        contentMode = .scaleAspectFit
        layer.cornerRadius = 12
    }

}
