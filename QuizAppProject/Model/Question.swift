//
//  Question.swift
//  QuizAppProject
//
//  Created by Onurcan Sever on 2021-10-31.
//

import Foundation

class Question {
    
    var questionName: String
    var questionAnswer: [Answer]
    
    init(questionName: String, questionAnswer: [Answer]) {
        self.questionName = questionName
        self.questionAnswer = questionAnswer
    }
    
}
