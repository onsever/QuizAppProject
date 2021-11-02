//
//  StartPageViewController.swift
//  QuizAppProject
//
//  Created by Onurcan Sever on 2021-11-01.
//

import UIKit

class StartPageViewController: UIViewController {
    
    private let imageView = QAImageView(image: "quizApp_logo")
    private let startGameButton = QAButton(title: "Start Game", color: .darkCharcoal)
    private let containerView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightCharcoal
        
        configureContainerView()
        configureImageView()
        configureGameButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }

    @objc private func startGamePressed() {
        navigationController?.pushViewController(QuizPageViewController(), animated: true)
    }

}

extension StartPageViewController {
    
    private func configureContainerView() {
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
        ])
    }
    
    private func configureImageView() {
        containerView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 150),
            imageView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func configureGameButton() {
        containerView.addSubview(startGameButton)
        
        startGameButton.addTarget(self, action: #selector(startGamePressed), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            startGameButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40),
            startGameButton.leadingAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            startGameButton.trailingAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            startGameButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
    
}
