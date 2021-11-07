//
//  QuizScoreViewController.swift
//  QuizAppProject
//
//  Created by Onurcan Sever on 2021-10-31.
//

import UIKit

class QuizScoreViewController: UIViewController {
    
    private var scoreCounter: Int = 0
    
    private let containerView = UIView()
    private let imageView = QAImageView()
    private lazy var tryAgainButton = QAButton(title: scoreCounter > 2 ? "Play again!": "Try again!", color: .darkCharcoal)
    private lazy var resultLabel = QALabel(labelTitle: QuizGame.shared.returnResult(scoreCounter: scoreCounter).getResultText(), numberOfLines: 1, fontSize: 35)
    
    private lazy var scoreLabel: UILabel = {
        let scoreLabel = UILabel()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let attributedTitle = NSMutableAttributedString(string: "\(scoreCounter) ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 40, weight: .bold), NSAttributedString.Key.foregroundColor: UIColor.aqua])
        attributedTitle.append(NSAttributedString(string: "/ 5", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 40, weight: .bold), NSAttributedString.Key.foregroundColor: UIColor.white]))
        
        scoreLabel.attributedText = attributedTitle
        
        return scoreLabel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightCharcoal
        navigationController?.isNavigationBarHidden = true
        
        configureContainerView()
        configureImageView()
        configureButton()
        configureResultLabel()
        configureScoreLabel()
        
        imageView.image = UIImage(named: QuizGame.shared.returnResult(scoreCounter: scoreCounter).getResultImage())
    }
    
    public func setScoreCounter(scoreCounter: Int) {
        return self.scoreCounter = scoreCounter
    }
    
    @objc private func resetGame() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension QuizScoreViewController {
    
    private func configureContainerView() {
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7)
        ])
    }
    
    private func configureImageView() {
        containerView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor, constant: 50),
            imageView.leadingAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            imageView.trailingAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.trailingAnchor, constant: -60),
            imageView.heightAnchor.constraint(equalToConstant: 75)
        ])
    }
    
    private func configureResultLabel() {
        containerView.addSubview(resultLabel)
        
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            resultLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            resultLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -30),
            resultLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func configureScoreLabel() {
        containerView.addSubview(scoreLabel)
        
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 20),
            scoreLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            scoreLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func configureButton() {
        view.addSubview(tryAgainButton)
        tryAgainButton.addTarget(self, action: #selector(resetGame), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            tryAgainButton.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 50),
            tryAgainButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            tryAgainButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60),
            tryAgainButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    
}
