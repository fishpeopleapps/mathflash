//
//  OperationQuestion.swift
//  MathFlash
//
//  Created by Kimberly Brewer on 12/25/23.
//

import Foundation

struct OperationQuestion: Question {
    var questionText: String
    var correctAnswer: Int
    var allAnswers: [Int]
    
    init() {
        let firstNum: Int
        let secondNum: Int
        let wrongVariations = [-2, -1, 1, 2] // showing them 0 is the answer, we need a slightly wrong answer
        // are we adding? subtracting? etc
        let operation: (Int, Int) -> Int
        let loki = Int.random(in: 1...5)
        switch loki {
        case 1:
            firstNum = Int.random(in: 2...20)
            secondNum = Int.random(in: 2...20)
            correctAnswer = firstNum + secondNum
            questionText = "\(firstNum) + \(secondNum)?"
            operation = (+)
        case 2:
            firstNum = Int.random(in: 2...20)
            secondNum = Int.random(in: 2...20)
            correctAnswer = firstNum - secondNum
            questionText = "\(firstNum) - \(secondNum)?"
            operation = (-)
        case 3:
            firstNum = Int.random(in: 2...12)
            secondNum = Int.random(in: 2...12)
            correctAnswer = firstNum * secondNum
            questionText = "\(firstNum) × \(secondNum)?"
            operation = (*)
        case 4:
            let otherNum = Int.random(in: 2...12)
            secondNum = Int.random(in: 2...12)
            firstNum = otherNum * secondNum
            correctAnswer = otherNum
            questionText = "\(firstNum) ÷ \(secondNum)?"
            operation = (/)
        case 5:
            firstNum = Int.random(in: 2...12)
            secondNum = firstNum
            correctAnswer = firstNum * secondNum
            questionText = "\(firstNum)²?"
            operation = (*)
        default:
            fatalError("Unknown loki: \(loki)")
        }
        allAnswers = (0...3).map { i in
        operation(firstNum, secondNum) + wrongVariations[i]
        }
        allAnswers.append(correctAnswer)
        allAnswers.shuffle()
    }
}
