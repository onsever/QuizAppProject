//
//  ViewController.swift
//  QuizAppProject
//
//  Created by Onurcan Sever on 2021-10-31.
//

import UIKit

class QuizPageViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var tableView = UITableView()
    private let questionContainerView = UIView()
    private let progressContainerView = UIView()
    private let answersContainerView = UIView()
    
    private var questionCounter: Int = 0
    private var scoreCounter: Int = 0
    private var randomQuestion: Int = Int.random(in: 0..<QuizGame.shared.getQuestions().count)
    private var questionChosen = [Int]()
    
    private lazy var questionLabel = QALabel(labelTitle: QuizGame.shared.getQuestion(with: randomQuestion), numberOfLines: 4, fontSize: 20)
    
    
    private let questionProgress: UIProgressView = {
        let questionProgress = UIProgressView(progressViewStyle: .bar)
        questionProgress.translatesAutoresizingMaskIntoConstraints = false
        questionProgress.setProgress(0.2, animated: true)
        questionProgress.trackTintColor = UIColor.lightCharcoal
        questionProgress.tintColor = UIColor.aqua
        questionProgress.layer.cornerRadius = 5
        questionProgress.layer.masksToBounds = true
        
        return questionProgress
    }()
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkCharcoal
        navigationItem.title = "Quiz App"
        navigationItem.setHidesBackButton(true, animated: true)
        
        configureQuestionContainerView()
        configureQuestionLabel()
        configureProgressContainerView()
        configureQuestionProgress()
        configureAnswersContainerView()
        configureTableView()
                
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        
        questionChosen.append(randomQuestion)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // After the current view disappears, 0.8 seconds later, properties which handles game logic resets it self.
        Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(resetGame), userInfo: nil, repeats: false)
    }
    
    // MARK: - Selectors
    
    @objc private func resetGame() {
        questionChosen.removeAll()
        randomQuestion = Int.random(in: 0..<QuizGame.shared.getQuestions().count)
        questionLabel.text = QuizGame.shared.getQuestion(with: randomQuestion)
        tableView.reloadData()
        scoreCounter = 0
        questionCounter = 0
        questionProgress.progress = 0.2
    }

}

// MARK: - UITableViewDelegate & UITableViewDataSource

extension QuizPageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return QuizGame.shared.getCount(with: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AnswerTableViewCell.identifier, for: indexPath) as! AnswerTableViewCell
        
        cell.configureCell(title: QuizGame.shared.getAnswer(with: randomQuestion, row: indexPath.row))
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        questionCounter += 1
        questionProgress.progress += 0.2
        
        if QuizGame.shared.isCorrect(with: randomQuestion, row: indexPath.row) {
            scoreCounter += 1
        }
        
        while questionChosen.contains(randomQuestion) {
            randomQuestion = Int.random(in: 0..<QuizGame.shared.getQuestions().count)
        }
        questionChosen.append(randomQuestion)
        
        if questionCounter == 5 {
            let viewController = QuizScoreViewController()
            viewController.setScoreCounter(scoreCounter: scoreCounter)
            navigationController?.pushViewController(viewController, animated: true)
        }
        else {
            questionLabel.text = QuizGame.shared.getQuestion(with: randomQuestion)
            tableView.reloadData()
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}

// MARK: - Configuring UI Elements

extension QuizPageViewController {
    
    private func configureQuestionContainerView() {
        view.addSubview(questionContainerView)
        
        questionContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        questionContainerView.backgroundColor = .darkCharcoal
        
        NSLayoutConstraint.activate([
            questionContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            questionContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            questionContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            questionContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2)
        ])
    }
    
    private func configureQuestionLabel() {
        questionContainerView.addSubview(questionLabel)
        
        NSLayoutConstraint.activate([
            questionLabel.centerYAnchor.constraint(equalTo: questionContainerView.centerYAnchor),
            questionLabel.leadingAnchor.constraint(equalTo: questionContainerView.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            questionLabel.trailingAnchor.constraint(equalTo: questionContainerView.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            questionLabel.heightAnchor.constraint(equalToConstant: 85)
            
        ])
    }
    
    private func configureProgressContainerView() {
        view.addSubview(progressContainerView)
        
        progressContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        progressContainerView.backgroundColor = .darkCharcoal
        
        NSLayoutConstraint.activate([
            progressContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            progressContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            progressContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            progressContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
        ])
    }
    
    private func configureQuestionProgress() {
        progressContainerView.addSubview(questionProgress)
        
        NSLayoutConstraint.activate([
            questionProgress.centerYAnchor.constraint(equalTo: progressContainerView.centerYAnchor),
            questionProgress.leadingAnchor.constraint(equalTo: progressContainerView.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            questionProgress.trailingAnchor.constraint(equalTo: progressContainerView.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            questionProgress.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    private func configureAnswersContainerView() {
        view.addSubview(answersContainerView)
        
        answersContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        answersContainerView.backgroundColor = .darkCharcoal
        
        NSLayoutConstraint.activate([
            answersContainerView.topAnchor.constraint(equalTo: questionContainerView.bottomAnchor),
            answersContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            answersContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            answersContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6)
        ])
    }
    
    private func configureTableView() {
        answersContainerView.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(AnswerTableViewCell.self, forCellReuseIdentifier: AnswerTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.alwaysBounceVertical = false
        tableView.alwaysBounceHorizontal = false
        tableView.isScrollEnabled = false
        
        NSLayoutConstraint.activate([
            tableView.centerYAnchor.constraint(equalTo: answersContainerView.centerYAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.heightAnchor.constraint(equalToConstant: 230)
        ])
    }
    
}

