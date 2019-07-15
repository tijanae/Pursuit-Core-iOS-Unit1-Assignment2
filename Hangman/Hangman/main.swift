//
//  main.swift
//  Hangman
//
//  Created by Alex Paul on 10/15/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

print("Hello, Agent!")

var secretCode = allTheWords.randomElement()!
var numberOfGuessesToBeWrong = 5
// let numberOfAttempts = 0 // Add to this number
var playAgain: String = "N"
// Draw blanks
var secretArr = [Character]()
var keyIndexDict = [Character : [Int]]()
var numbOfUserGuesses = 0

func makeLinesToStartGame () {
    for (index,letter) in secretCode.enumerated() {
        secretArr.append("_")
        if var letterIndexArray = keyIndexDict[letter] {
            letterIndexArray.append(index)
            keyIndexDict[letter] = letterIndexArray
        } else {
            keyIndexDict[letter] = [index]
        }
    }
}

func drawLines () {
    for letter in secretArr{
        print(letter, terminator: " ")
    }
}
func printGameBoard () {
    for letter in secretArr{
        print(letter, terminator: " ")
    }
}

// Handle user input
func handleInput() {
    
    print("\n\nEnter your guess my vulnerable friend... ", terminator: "")
    print("Keep in mind... \(numbOfUserGuesses) guess(es) and counting.")
    if let userGuess = readLine() {
        // check if it is in the dictonary
        if keyIndexDict[Character(userGuess)] != nil {
            print("user guessed a correct letter")
            for index in keyIndexDict[Character(userGuess)]! {
                secretArr[index] = Character(userGuess)
                numbOfUserGuesses += 1
            }
            // print
            printGameBoard()
            if Array(secretCode) == secretArr {
                print("")
                print("...Fine. Take your agent and leave before I change my mind.")
                print("Let me know if you want to save his friend...")
                numberOfGuessesToBeWrong = -1
            }
        } else {
            // logic for if user guessed wrong
            print("You Guessed wrong!")
            print("You now have \(numberOfGuessesToBeWrong) chances.")
            printGameBoard()
            numberOfGuessesToBeWrong -= 1
            numbOfUserGuesses += 1
        }
    }
}

func hangmanGameStart() {
    // Welcome Statement
    print("Have you come to save a friend? Dont be shy- Tell me your name...")
    let playerName = readLine()
    print("Ah, \(playerName!)! I've heard of your brilliance! We should play a game!")
    print("Your friend is behind this door. Guess my code, and you both go free. Fail, and we get medival!")
    print("Nervous? Don't worry... I'll give you a limited number opportunities to guess the code.")
    // empty old information
    secretArr = [Character]()
    keyIndexDict = [Character : [Int]]()
    numbOfUserGuesses = 0
    numberOfGuessesToBeWrong = 5
    // choose word
    secretCode = allTheWords.randomElement()!
    // draw lines
    makeLinesToStartGame()
    print(secretCode)
    print(keyIndexDict)
    print("\n\n\n\n")
    drawLines()
    
}
repeat {
    hangmanGameStart()
    // Game Is played here
    while numberOfGuessesToBeWrong >= 0 {
        handleInput()
    }
    print("")
    print("YAAAWWNNNNN.. Really? \(numbOfUserGuesses) chances and you couldnt guess the word :: \(secretCode) ::? I had hoped this would be exciting...")
    print("GAME OVER!")
    print("Do you want to play again? y/n")
    if let restartGame = readLine(){
        if restartGame == "y"{
            playAgain = "y"
        }
        else {
            playAgain = "n"
        }
    }
} while playAgain == "y"
print()
print()
print("This was fun! Come back later!")

