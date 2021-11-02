//
//  Result.swift
//  QuizAppProject
//
//  Created by Onurcan Sever on 2021-11-01.
//

import Foundation

class Result {
    private var resultImage: String
    private var resultText: String
    
    init(resultImage: String, resultText: String) {
        self.resultImage = resultImage
        self.resultText = resultText
    }
    
    public func getResultImage() -> String {
        return self.resultImage
    }
    
    public func getResultText() -> String {
        return self.resultText
    }
}
