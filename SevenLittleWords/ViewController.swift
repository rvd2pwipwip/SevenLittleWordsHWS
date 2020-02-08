//
//  ViewController.swift
//  SevenLittleWords
//
//  Created by Herve Desrosiers on 2020-02-06.
//  Copyright © 2020 Herve Desrosiers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var letterButtons = [UIButton]()
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        setScoreLabel()
        setCluesLabel()
        setAnswersLabel()
        setCurrentAnswer()
        setSubmitButton()
        setClearButton()
        setButtonsContainer()
        setLetterButtons()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setScoreLabel() {
        view.addSubview(scoreLabel)
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scoreLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
        ])
    }
    
    private func setCluesLabel() {
        view.addSubview(cluesLabel)
        NSLayoutConstraint.activate([
            cluesLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
            cluesLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 100),
            cluesLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.6, constant: -100),
        ])
        cluesLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
    }
    
    private func setAnswersLabel() {
        view.addSubview(answersLabel)
        NSLayoutConstraint.activate([
            answersLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
            answersLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -100),
            answersLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.4, constant: -100),
            answersLabel.heightAnchor.constraint(equalTo: cluesLabel.heightAnchor),
        ])
        answersLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
    }
    
    private func setCurrentAnswer() {
        view.addSubview(currentAnswer)
        NSLayoutConstraint.activate([
            currentAnswer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            currentAnswer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            currentAnswer.topAnchor.constraint(equalTo: cluesLabel.bottomAnchor, constant: 20),
        ])
    }
    
    private func setSubmitButton() {
        view.addSubview(submitButton)
        NSLayoutConstraint.activate([
            submitButton.topAnchor.constraint(equalTo: currentAnswer.bottomAnchor),
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
            submitButton.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
    
    private func setClearButton() {
        view.addSubview(clearButton)
        NSLayoutConstraint.activate([
            clearButton.centerYAnchor.constraint(equalTo: submitButton.centerYAnchor),
            clearButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            clearButton.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
    
    private func setButtonsContainer() {
        view.addSubview(buttonsContainer)
        NSLayoutConstraint.activate([
            buttonsContainer.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 20),
            buttonsContainer.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20),
            buttonsContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsContainer.widthAnchor.constraint(equalToConstant: 750),
            buttonsContainer.heightAnchor.constraint(equalToConstant: 320),
        ])
    }
    
    private let scoreLabel: UILabel = {
        let sl = UILabel()
        sl.translatesAutoresizingMaskIntoConstraints = false
        sl.textAlignment = .right
        sl.text = "Score: 0"
        return sl
    }()
    
    private let cluesLabel: UILabel = {
        let cl = UILabel()
        cl.translatesAutoresizingMaskIntoConstraints = false
        cl.font = UIFont.systemFont(ofSize: 24, weight: .light)
        cl.text = "CLUES"
        cl.numberOfLines = 0
//        cl.backgroundColor = .purple
        return cl
    }()
    
    private let answersLabel: UILabel = {
        let al = UILabel()
        al.translatesAutoresizingMaskIntoConstraints = false
        al.font = UIFont.systemFont(ofSize: 24, weight: .light)
        al.text = "ANSWERS"
        al.numberOfLines = 0
        al.textAlignment = .right
//        al.backgroundColor = .red
        return al
    }()
    
    private let currentAnswer: UITextField = {
        let ca = UITextField()
        ca.translatesAutoresizingMaskIntoConstraints = false
        ca.placeholder = "Tap letters to guess"
        ca.textAlignment = .center
        ca.font = UIFont.systemFont(ofSize: 44, weight: .light)
        ca.isUserInteractionEnabled = false
//        ca.backgroundColor = .orange
        return ca
    }()
    
    private let submitButton: UIButton = {
        let sb = UIButton(type: .system)
        sb.translatesAutoresizingMaskIntoConstraints = false
        sb.setTitle("SUBMIT", for: .normal)
        return sb
    }()
    
    private let clearButton: UIButton = {
        let sb = UIButton(type: .system)
        sb.translatesAutoresizingMaskIntoConstraints = false
        sb.setTitle("CLEAR", for: .normal)
        return sb
    }()
    
    private let buttonsContainer: UIView = {
        let bc = UIView()
        bc.translatesAutoresizingMaskIntoConstraints = false
//        bc.backgroundColor = .yellow
        return bc
    }()
    
    // set some values for the width and height of each button
    let width = 150
    let height = 80
    
    // create 20 buttons as a 4x5 grid
    private func setLetterButtons() {
        for row in 0..<4 {
            for col in 0..<5 {
                let lettersButton: UIButton = {
                    let lb = UIButton(type: .system)
                    // NO translatesAutoresizingMaskIntoConstraints = false
                    lb.titleLabel?.font = UIFont.systemFont(ofSize: 36)
                    lb.setTitle("WWW", for: .normal)
                    let frame = CGRect(x: col * width, y: row * height, width: width, height: height) // calculate the frame of this button using its column and row
                    lb.frame = frame
                    return lb
                }()
                buttonsContainer.addSubview(lettersButton) // add button inside buttonsContainer
                letterButtons.append(lettersButton) // and also to letterButtons array
            }
        }
    }
}

