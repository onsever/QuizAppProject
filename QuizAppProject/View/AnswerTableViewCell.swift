//
//  AnswerTableViewCell.swift
//  QuizAppProject
//
//  Created by Onurcan Sever on 2021-11-01.
//

import UIKit

class AnswerTableViewCell: UITableViewCell {
    
    static let identifier = "answerCell"
    
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

/*
 LEGACY CODE:
 private let answerButton: UIButton = {
     let answerButton = UIButton()
     answerButton.translatesAutoresizingMaskIntoConstraints = false
     answerButton.layer.cornerRadius = 12
     answerButton.layer.borderWidth = 2
     answerButton.backgroundColor = UIColor.systemOrange
     
     return answerButton
 }()
 
 private func configureButton() {
     NSLayoutConstraint.activate([
         answerButton.topAnchor.constraint(equalTo: contentView.topAnchor),
         answerButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
         answerButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
         answerButton.heightAnchor.constraint(equalToConstant: 50)
     ])
 }
 
 private lazy var questionLabel: UILabel = {
     let questionLabel = UILabel()
     questionLabel.translatesAutoresizingMaskIntoConstraints = false
     questionLabel.text = QuizGame.shared.questions[randomQuestion].questionName
     questionLabel.textAlignment = .center
     questionLabel.font = .systemFont(ofSize: 20, weight: .semibold)
     questionLabel.numberOfLines = 4
     
     return questionLabel
 }()
 
 public func checkScore(scoreCounter: Int) -> String {
     switch scoreCounter {
     case 0, 1, 2:
         return "Please try again!"
     case 3:
         return "Good job!"
     case 4:
         return "Excellent work!"
     default:
         return "You are a genius!"
     }
 }

 */
