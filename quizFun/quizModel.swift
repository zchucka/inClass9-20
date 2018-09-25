//
//  quizModel.swift
//  quizFun
//
//  Created by Chucka, Zachary Tyler on 9/20/18.
//  Copyright © 2018 Chucka, Zachary Tyler. All rights reserved.
//

import Foundation

struct QuizModel {
    // use parallel arrays for our questions and their answers
    
    private let questions: [String]
    private let answers: [String]
    private var currentQuestionIndex: Int
    
    init() {
        questions = ["how old am I?", "Where am I from?", "Who will win the NCAA tourney"]
        answers = ["21", "Renton", "Gonzaga"]
        currentQuestionIndex = -1
    }
    
    // MARK: - Access modifiers
    // control access to state and behavior
    // internal: default access modifier, accessible anywhere in this app or framework
    // private: only accessible in this object
    // private(set): accessible (view only) anywhere in app but only writable within this object
    // fileprivate: accessible only within this source file
    // public: used by frameworks
    // open: used by frameworks
    
    // API: application programming interface
    // expose limited state and functionality
    // "encapsulate" things that the outside world shouldn't see
    
    mutating func getNextQuestion() -> String {
        currentQuestionIndex += 1
        currentQuestionIndex %= questions.count
        return questions[currentQuestionIndex]
    }
    
    mutating func getCurrentAnswer() -> String {
        return answers[currentQuestionIndex]
    }
}
