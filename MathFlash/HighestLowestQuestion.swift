//
//  HighestLowestQuestion.swift
//  MathFlash
//
//  Created by Kimberly Brewer on 12/20/23.
//

import Foundation

struct HighestLowestQuestion: Question {
    var questionText: String
    var correctAnswer: Int
    var allAnswers: [Int]
    
    init() {
        let loki = Int.random(in: 1...3)
        let numRange: ClosedRange<Int>
        let fluctuation: [Int]
        switch loki {
        case 1:
            numRange = 20...90
            fluctuation = (-5...5).shuffled()
        case 2:
            numRange = 1050...9050
            fluctuation = (-50...50).shuffled()
        case 3:
            numRange = 10_500...900_500
            fluctuation = (-50...50).shuffled()
        default:
            fatalError("Unknown variant: \(loki)")
        }
        let baseNumber = Int.random(in: numRange)
        allAnswers = (1...5).map { i in
            baseNumber + fluctuation[i]
        }
        if Bool.random() {
            questionText = "Highest?"
            correctAnswer = allAnswers.max() ?? 0
            
        } else {
            questionText = "Lowers?"
            correctAnswer = allAnswers.min() ?? 0
        }
    }
}
