//
//  ViewController.swift
//  quizFun
//
//  Created by Chucka, Zachary Tyler on 9/20/18.
//  Copyright © 2018 Chucka, Zachary Tyler. All rights reserved.
// icon from: <div>Icons made by <a href="http://www.freepik.com" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
// resize by clicking go to tools then drag image into xcassests
import UIKit

// MARK: - Project Structure
// first, folders in Xcode are not folders, they are called groups
// changes to groups do not change folders on the file system
// - Quiz fun group
// -- AppDelegate.swift: contains code that acts as the middle man between your app and your OS
// -- viewController.swift: this file, part of the MVC (model view controller) design pattern
// -- main.storyboard: an archive of view objects that are edited by interface builder (IB)
// -- assest.xcassets: this is a collection of assets/resources for your app ex. images, sound, etc
// LaunchScreen.storyboard: when an app is first launched, there is a launch screen (aka loading creen)
//                          that shows
// -- Info.plist: a "property list" file. a dictionary of important info about your app
// - products
// -- quizFun.app: your app's binary executable

// MARK: - MVC notes
// Design pattern is a reusable solution to a common software engineering problem
// model view controller design pattern is often used for apps/programs that have a GUI
// Model Layer: stores and serves data for your app
// example: Quiz object that provides quiz questions and quiz answers
// view layer: manages the views for your app
// example: main.storyboard file, we will put labels and buttons for our quiz game
// Controller layer: middle man between the Model Layer and the view layer... prepare data for displaying by the view and handle user interactions with the view (events)
// example: viewController.swift will get quiz questions from the quiz struct and handle button presses in the view layer
// not direct communication between model and view

class ViewController: UIViewController {
    // viewcontroller is a subclass of UIViewcontroller
    var quizModel = QuizModel()
    
    
    // MARK: - Connections
    // so we have some views in our view layer (main.storyboard) and need to write some code that does stuff when the user interacts with them
    // connections are used for two objects to communicate
    // for example: user clicks show answer button, then ViewController.swift should execute code to query our model for the answer, then update the answerLabel in the view layer
    
    // references to our UILabels
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    // @IBOutlet tells Xcode this property references an object in interface builder (ex Main.storyboard)
    // UILabel! - this type is an automatically unwrapped optional
    // an open circle in the margin which means an invalid connection, a closed circle means a valid connection
    
    // we need to define actions for our buttons
    // when a button is pressed an action (method) should execute
    @IBAction func nextQuestionPressed(_ sender: UIButton)
    {
        // this is an example of iOS's target-action design pattern
        // viewController is the target
        // nextQuestionPressed() is the action
        print("next question was pressed")
        
        let question = quizModel.getNextQuestion()
        questionLabel.text = question
        answerLabel.text = "<Answer>"
    }
    
    @IBAction func showCurrentAnswerPressed(_ sender: UIButton)
    {
        print("show answer is pressed")
        
        let answer = quizModel.getCurrentAnswer()
        answerLabel.text = answer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // this method is called when the view controller's parent view object has been loaded into memory but has not been displayed on the screen
        print("Hello from viewDidLoad")
        
        // we need to set the question label to show the first question
        let question = quizModel.getNextQuestion()
        questionLabel.text = question
    }


}

