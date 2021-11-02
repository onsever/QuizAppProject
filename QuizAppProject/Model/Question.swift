//
//  Question.swift
//  QuizAppProject
//
//  Created by Onurcan Sever on 2021-10-31.
//

import Foundation

class Question {
    
    private var questionName: String
    private var questionAnswer: [Answer]
    
    init(questionName: String, questionAnswer: [Answer]) {
        self.questionName = questionName
        self.questionAnswer = questionAnswer
    }
    
    public func getQuestionName() -> String {
        return self.questionName
    }
    
    public func getQuestionAnswer() -> [Answer] {
        return self.questionAnswer
    }
    
}
