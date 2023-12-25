//
//  ViewModel.swift
//  MathFlash
//
//  Created by Kimberly Brewer on 12/8/23.
//

import Foundation

@Observable
// so we're adding this so we don't have to put viewModel.question.questionText - you've seen this before!
@dynamicMemberLookup
class ViewModel {
    enum PlayState {
        case menu, playing, gameOver
    }
    // private(set) means you cant change it anywhere else
    private(set) var playState = PlayState.menu
    var questionNum = 0
    // we are explicitely unwrapping this because we need to use it in the nextQuestion func
    var currentQuestion: (any Question)!
    // adding some pressure to the user
    var timeAllowed = 10.0
    let allQuestions: [any Question.Type] = [
        MultiplesQuestion.self,
        HowManyMultiplesQuestion.self,
        HighestLowestQuestion.self,
        OperationQuestion.self
    ]
    // we have to add this for the dynamicMemberLookup to work
    subscript<Value>(dynamicMember keypath: KeyPath<Question, Value>) -> Value {
        currentQuestion[keyPath: keypath]
    }
    // this is to ensure that currentQuestion is never empty, because to init this ViewModel you must call nextQuestion func
    init() {
        nextQuestion()
    }
    
    func nextQuestion() {
        currentQuestion = allQuestions.randomElement()!.init()
        questionNum += 1
        timeAllowed *= 0.99 // we're shrinking the time left so the game has to end eventually
    }
    func checkAnswer(_ answer: Int) {
        if answer == currentQuestion.correctAnswer {
            nextQuestion()
        } else {
            gameOver()
        }
    }
    func gameOver() {
        playState = .gameOver
        UserDefaults.standard.set(questionNum - 1, forKey: "LastScore")
    }
    func start() {
        playState = .playing
        timeAllowed = 10.0
        questionNum = 0
        nextQuestion()
    }
    func end() {
        // it's not game over, we just want to exit the game
        playState = .menu
    }
}
