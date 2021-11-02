//
//  QuizGame.swift
//  QuizAppProject
//
//  Created by Onurcan Sever on 2021-10-31.
//

import Foundation

final class QuizGame {
    
    static let shared = QuizGame()
    
    init() {}
    
    public let questions: [Question] = [
        Question(questionName: "Who founded Apple Computer?", questionAnswer: [
            Answer(questionAnswer: "Stephen Fry", isCorrect: false),
            Answer(questionAnswer: "Bill Gates", isCorrect: false),
            Answer(questionAnswer: "Steve Jobs", isCorrect: true),
            Answer(questionAnswer: "Stephen Hawking", isCorrect: false)
        ]),
        Question(questionName: "Which of these is not a peripheral, in computer terms?", questionAnswer: [
            Answer(questionAnswer: "Keyboard", isCorrect: false),
            Answer(questionAnswer: "Monitor", isCorrect: false),
            Answer(questionAnswer: "Mouse", isCorrect: false),
            Answer(questionAnswer: "Motherboard", isCorrect: true)
        ]),
        Question(questionName: "Which of the following is not one of the early “protocols,” or ways to use the Internet?", questionAnswer: [
            Answer(questionAnswer: "Blogging", isCorrect: true),
            Answer(questionAnswer: "Telnet", isCorrect: false),
            Answer(questionAnswer: "Gopher", isCorrect: false),
            Answer(questionAnswer: "FTP", isCorrect: false)
        ]),
        Question(questionName: "What does the Internet prefix WWW stand for?", questionAnswer: [
            Answer(questionAnswer: "Wide Width Wickets", isCorrect: false),
            Answer(questionAnswer: "World Wide Web", isCorrect: true),
            Answer(questionAnswer: "Worldwide Weather", isCorrect: false),
            Answer(questionAnswer: "Western Washington World", isCorrect: false)
        ]),
        Question(questionName: "What is the name for a computer pointing device?", questionAnswer: [
            Answer(questionAnswer: "A Mouse", isCorrect: true),
            Answer(questionAnswer: "Sound Card", isCorrect: false),
            Answer(questionAnswer: "RAM", isCorrect: false),
            Answer(questionAnswer: "Monitor", isCorrect: false)
        ]),
        Question(questionName: "Which of these is a file format for digital images?", questionAnswer: [
            Answer(questionAnswer: "CIA", isCorrect: false),
            Answer(questionAnswer: "JPG", isCorrect: true),
            Answer(questionAnswer: "ICBM", isCorrect: false),
            Answer(questionAnswer: "IBM", isCorrect: false)
        ]),
        Question(questionName: "To which of these devices is the cellular telephone most closely related?", questionAnswer: [
            Answer(questionAnswer: "Telegraph", isCorrect: false),
            Answer(questionAnswer: "Radio", isCorrect: true),
            Answer(questionAnswer: "Lightbulb", isCorrect: false),
            Answer(questionAnswer: "Telescope", isCorrect: false)
        ]),
        Question(questionName: "Which of these is an the generic term for a collection of private computer networks within an organization?", questionAnswer: [
            Answer(questionAnswer: "Intranet", isCorrect: true),
            Answer(questionAnswer: "Extranet", isCorrect: false),
            Answer(questionAnswer: "Internet", isCorrect: false),
            Answer(questionAnswer: "Network", isCorrect: false)
        ]),
        Question(questionName: "What is a Codec most commonly used for?", questionAnswer: [
            Answer(questionAnswer: "Decoding Passwords", isCorrect: false),
            Answer(questionAnswer: "Decoding Audio/Video Stream", isCorrect: true),
            Answer(questionAnswer: "Encrypting Data", isCorrect: false),
            Answer(questionAnswer: "Saving Contact Information", isCorrect: false)
        ]),
        Question(questionName: "What Does RAID Stand for?", questionAnswer: [
            Answer(questionAnswer: "Random Access Inside Disks", isCorrect: false),
            Answer(questionAnswer: "Reload Advanced Intel Device", isCorrect: false),
            Answer(questionAnswer: "Relocate Array Inside Drive", isCorrect: false),
            Answer(questionAnswer: "Redundant Array of Inexpensive Disks", isCorrect: true)
        ]),
    ]
    
    public func returnResult(scoreCounter: Int) -> Result {
        switch scoreCounter {
        case 0, 1, 2:
            return Result(resultImage: "fail", resultText: "Please try again!")
        case 3:
            return Result(resultImage: "trophy", resultText: "Good job!")
        case 4:
            return Result(resultImage: "trophy", resultText: "Excellent work!")
        default:
            return Result(resultImage: "trophy", resultText: "You are a genius!")
        }
    }
    
}
