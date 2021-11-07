//
//  AnswerTableViewCell.swift
//  QuizAppProject
//
//  Created by Onurcan Sever on 2021-11-01.
//

import UIKit

class AnswerTableViewCell: UITableViewCell {
    
    public static let identifier = "answerCell"
    
    private let answerLabel: UILabel = {
        let answerLabel = UILabel()
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        answerLabel.textAlignment = .center
        answerLabel.layer.cornerRadius = 12
        answerLabel.layer.backgroundColor = UIColor.lightCharcoal.cgColor
        answerLabel.layer.masksToBounds = true
        answerLabel.layer.borderWidth = 2
        answerLabel.layer.borderColor = UIColor.aqua.cgColor
        answerLabel.textColor = .lightGray
        
        return answerLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(answerLabel)
        contentView.backgroundColor = .darkCharcoal
        configureAnswerLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureCell(title: String) {
        answerLabel.text = title
    }
    
    private func configureAnswerLabel() {
        NSLayoutConstraint.activate([
            answerLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            answerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            answerLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            answerLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

}
