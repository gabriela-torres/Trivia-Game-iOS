//
//  TriviaQuestion.swift
//  Trivia Game ios
//
//  Created by Gabriela Torres on 10/19/18.
//  Copyright © 2018 Gabriela Torres. All rights reserved.
//

import Foundation

class TriviaQuestion {
    //String storing the text of the question
    let question: String
    //String storing the array of possible answers
    let answers: [String]
    //Integer to store the index of the correct answer in our answer array
    let correctAnswersIndex: Int
    
    init(question: String, answers: [String], correctAnswersIndex: Int) {
        self.question = question
        self.answers = answers
        self.correctAnswersIndex = correctAnswersIndex
    }
    //Computed property that returns the correct answer using the answer index
    var correctAnswer: String {
        return answers[correctAnswersIndex]
    }
}

