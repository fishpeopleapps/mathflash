//
//  Question.swift
//  MathFlash
//
//  Created by Kimberly Brewer on 12/20/23.
//

import Foundation

protocol Question {
    var questionText: String { get set }
    var correctAnswer: Int { get set }
    var allAnswers: [Int] { get set }
    init()
}
