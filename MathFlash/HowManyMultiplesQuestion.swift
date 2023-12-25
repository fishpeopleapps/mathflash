//
//  HowManyMultiplesQuestion.swift
//  MathFlash
//
//  Created by Kimberly Brewer on 12/8/23.
//

import Foundation

struct HowManyMultiplesQuestion: Question {
    var questionText: String
    var correctAnswer: Int
    var allAnswers: [Int]
    
    init() {
        var numbers = (2...12).shuffled()
        correctAnswer = numbers.removeFirst()
        let multiple = Int.random(in: 2...12)
        let adjustment = Int.random(in: 0...multiple - 1)
        let targetNumber = correctAnswer * multiple + adjustment
        questionText = "How many \(multiple)s in \(targetNumber)?"
        // fill in our answers array with the wrong options
        allAnswers = Array(numbers.prefix(4))
        // add in the correct answer
        allAnswers.append(correctAnswer)
        // and of course shuffle it up so its not always in the same spot
        allAnswers.shuffle()
    }
}
