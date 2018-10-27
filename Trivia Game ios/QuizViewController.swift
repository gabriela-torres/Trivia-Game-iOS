//
//  ViewController.swift
//  Trivia Game ios
//
//  Created by Gabriela Torres on 10/18/18.
//  Copyright © 2018 Gabriela Torres. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var AnswerAButton: UIButton!
    @IBOutlet weak var AnswerBButton: UIButton!
    @IBOutlet weak var AnswerCButton: UIButton!
    @IBOutlet weak var AnswerDButton: UIButton!
    
    @IBAction func ResetButtonTapped(_ sender: Any) {
        resetGame()
    }
    

    var questions = [TriviaQuestion]()
    var questionsPlaceholder = [TriviaQuestion]()
    
    var currentIndex: Int!
    
    var score = 0 {
        didSet {
            ScoreLabel.text = "Score: \(score)"
        }
    }
    var currentQuestion: TriviaQuestion! {
        didSet {
            if let currentQuestion = currentQuestion {
                QuestionLabel.text = currentQuestion.question
                AnswerAButton.setTitle(currentQuestion.answers[0], for: .normal)
                AnswerBButton.setTitle(currentQuestion.answers[1], for: .normal)
                AnswerCButton.setTitle(currentQuestion.answers[2], for: .normal)
                AnswerDButton.setTitle(currentQuestion.answers[3], for: .normal)
                setNewColor()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        populateQuestions()
        setNewColor()
        getNewQuestion()
    }

    func populateQuestions() {
        let question1 = TriviaQuestion(question: "Who interrupted Taylor Swift’s acceptance speech at the 2009 Video Music Awards?", answers: ["Eminem", "Jay-Z", "Chris Brown", "Kanye West"], correctAnswersIndex: 3)
        let question2 = TriviaQuestion(question: "How old was American musician Jimi Hendrix when he passed away in 1970?", answers: ["30", "27", "25", "35"], correctAnswersIndex: 1)
        let question3 = TriviaQuestion(question: "Victoria Beckham was a member of which all girl English pop group formed in 1994?", answers: ["Destiny's Child", "TLC", "The Spice Girls", "The Bangles"], correctAnswersIndex: 2)
        let question4 = TriviaQuestion(question: "What was the name of the Eminem single that set the world’s record in 2013 for the most words used in a song?", answers: ["Rap God", "Venom", "Stan", "No Love"], correctAnswersIndex: 0)
        let question5 = TriviaQuestion(question: "Award winning Latina pop artist Shakira was born in raised in what Country?", answers: ["Argentina", "Spain", "Puerto Rico", "Colombia"], correctAnswersIndex: 3)
        let question6 = TriviaQuestion(question: "What was the highest selling album of the 1980s in the United States?", answers: ["Back in Black by AD/DC", "Thriller by Michael Jackson", "Scary Monsters (and Super Creeps) by David Bowie", "Dirty Mind by Prince"], correctAnswersIndex: 1)
        let question7 = TriviaQuestion(question: "“All Shook Up” is a song that topped the U.S. Billboard Hot 100 on April 13, 1957. Who was the singer?", answers: ["Guy Mitchell", "Pat Boone", "Elvis Presley", "Perry Como"], correctAnswersIndex: 2)
        let question8 = TriviaQuestion(question: "New Orleans is known as the birthplace of what type of music?", answers: ["Jazz", "Pop Music", "Blues", "Regge"], correctAnswersIndex: 0)
        let question9 = TriviaQuestion(question: "Which music group has received the most Grammy Awards?", answers: ["Dixie Chicks", "Foo Fighters", "U2", "Alison Krauss and Union Station"], correctAnswersIndex: 2)
        let question10 = TriviaQuestion(question: "What famous female singer died of alcohol poisoning in 2011 at the age of 27?", answers: ["Betty Ford", "Jane Russell", "Annette Charles", "Amy Winehouse"], correctAnswersIndex: 3)
        let question11 = TriviaQuestion(question: "Who was Dionne Warwick’s most famous cousin?", answers: ["Aretha Franklin", "Whitney Houston", "Bobby Brown", "David Elliott"], correctAnswersIndex: 1)
        let question12 = TriviaQuestion(question: "Who rose to fame in 2008 with the release of the single I Kissed a Girl?", answers: ["Selena Gomez", "Miley Cyrus", "Rihanna", "Katy Perry"], correctAnswersIndex: 3)
        let question13 = TriviaQuestion(question: "Hallelujah is a song written by which Canadian recording artist?", answers: ["Celine Dion", "Neil Young", "Leonard Cohen ", "Justin Bieber"], correctAnswersIndex: 2)
        let question14 = TriviaQuestion(question: "Who is the most successful UK solo artist in the US?", answers: ["Adele", "Elton John", "John Lennon", "Jessie J"], correctAnswersIndex: 1)
        let question15 = TriviaQuestion(question: "What was the number one US ringtone of 2005?", answers: ["Candyshop", "Hollaback Girl", "1, 2 Step", "Since U Been Gone"], correctAnswersIndex: 0)
        let question16 = TriviaQuestion(question: "What is Fergie's real name?", answers: ["Stacie Fergie", "Ferguson", "Stacy Ann Ferguson", "Annie Fergie"], correctAnswersIndex: 2)
        let question17 = TriviaQuestion(question: "How did Kurt Kobain end his life?", answers: ["Overdose on pills", "Natural Death", "Murdered", "A shotgun"], correctAnswersIndex: 3)
        let question18 = TriviaQuestion(question: "Which Beatle performed a James Bond theme song?", answers: ["John Lennon", "George Harrison", "Paul McCartney", "Ringo Starr"], correctAnswersIndex: 2)
        let question19 = TriviaQuestion(question: "Snoop Dogg featured in which 2010 song by Katy Perry?", answers: ["Roar", "California Gurls", "Dark Horse", "Hot n Cold"], correctAnswersIndex: 1)
        let question20 = TriviaQuestion(question: "Who wrote “Manic Monday” for The Bangles?", answers: ["Prince", "Bruce Hornsby", "Madonna", "Bruce Springsteen"], correctAnswersIndex: 0)
        questions = [question1, question2, question3, question4, question5, question6, question7, question8, question9, question10, question11, question12, question13, question14, question15, question16, question17, question18, question19, question20]
    }
    func getNewQuestion() {
        if questions.count > 0 {
            currentIndex = Int.random(in: 0..<questions.count)
            currentQuestion = questions[currentIndex]
        } else {
            showGameOverAlert()
            
        }
    }
    
    func showGameOverAlert() {
        let endAlert = UIAlertController(title: "Trivia Result", message: "Game over! Your score was \(score) out of \(questionsPlaceholder.count).", preferredStyle: UIAlertController.Style.alert)
        let resetAction = UIAlertAction(title: "Reset", style: UIAlertAction.Style.default) {UIAlertAction in
            self.resetGame()
        }
        endAlert.addAction(resetAction)
        self.present(endAlert, animated: true, completion: nil)
    }
    
    let backgroundColors = [
        UIColor(red: 163/255, green: 214/255, blue: 255/255, alpha: 1.0),
        UIColor(red: 250/255, green: 163/255, blue: 255/255, alpha: 1.0),
        UIColor(red: 255/255, green: 204/255, blue: 163/255, alpha: 1.0),
        UIColor(red: 168/255, green: 255/255, blue: 163/255, alpha: 1.0)

    ]

    func setNewColor() {
        let randomNumber = Int.random(in: 1...100)
        let randomColorA = backgroundColors[randomNumber % 4]
        let randomColorB = backgroundColors[(randomNumber + 1) % 4]
        let randomColorC = backgroundColors[(randomNumber + 2) % 4]
        let randomColorD = backgroundColors[(randomNumber + 3) % 4]
        
        AnswerAButton.backgroundColor = randomColorA
        AnswerBButton.backgroundColor = randomColorB
        AnswerCButton.backgroundColor = randomColorC
        AnswerDButton.backgroundColor = randomColorD
    }
    @IBAction func AnswerTapped(_ sender: UIButton) {
        if currentQuestion.correctAnswersIndex == sender.tag {
            score += 1
            showCorrectAnswerAlert()
        } else {
            showIncorrectAnswerAlert()
        }
    }
    
    func showIncorrectAnswerAlert(){
        let incorrectAlert = UIAlertController(title: "Incorrect", message: "\(currentQuestion.correctAnswer) is the correct answer.", preferredStyle: .actionSheet)
        let okayAction = UIAlertAction(title: "Sorry", style: UIAlertAction.Style.default) { UIAlertAction in
            self.questionsPlaceholder.append(self.questions[self.currentIndex])
            self.questions.remove(at: self.currentIndex)
            self.getNewQuestion()
        }
        incorrectAlert.addAction(okayAction)
        self.present(incorrectAlert, animated: true, completion: nil)
    }
    
    func showCorrectAnswerAlert() {
        let correctAlert = UIAlertController(title: "Correct", message: "\(currentQuestion.correctAnswer) is the correct answer! YAY!", preferredStyle: .actionSheet)
        let okayAction = UIAlertAction(title: "Thank you!", style: UIAlertAction.Style.default) { UIAlertAction in
            self.questionsPlaceholder.append(self.questions[self.currentIndex])
            self.questions.remove(at: self.currentIndex)
            self.getNewQuestion()
        }
        correctAlert.addAction(okayAction)
        self.present(correctAlert, animated: true, completion: nil)
    }
    
    @IBAction func unwindToQuizScreen(segue:UIStoryboardSegue){}
    
    func resetGame() {
        score = 0
        if !questions.isEmpty {
            questionsPlaceholder.append(contentsOf: questions)
            questions.removeAll()
        }
        questions = questionsPlaceholder
        questionsPlaceholder.removeAll()
        getNewQuestion()
    }
}









