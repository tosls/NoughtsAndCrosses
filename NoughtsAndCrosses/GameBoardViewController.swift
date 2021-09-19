//
//  ViewController.swift
//  NoughtsAndCrosses
//
//  Created by Антон Бобрышев on 19.09.2021.
//

import UIKit

class GameBoardViewController: UIViewController {
        
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var aISymbol: UILabel!
    @IBOutlet weak var playerSymbol: UILabel!
    
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    private var firtsTurn = Symbol.Cross
    private var currentTurn = Symbol.Cross
    
    private var nought = "O"
    private var cross = "X"
    private var board = [UIButton]()
    
    private var noughtsScore = 0
    private var crossesScore = 0

    override func viewDidLoad() {
        super.viewDidLoad()
 
        initBoard()
    }
    
    @IBAction func resetButtonTapped() {
        resetBoard()
        noughtsScore = 0
        crossesScore = 0
        updateScore()
    }
    
    @IBAction func boardTapAction(_ sender: UIButton) {
        addToBoard(sender)
        
        if checkForVictory(cross) {
            crossesScore += 1
            resultAlert(title: "Crosses Win!")
            updateScore()
        }
        if checkForVictory(nought) {
            noughtsScore += 1
            resultAlert(title: "Noughts Win!")
            updateScore()
        }
        if fullBoard() {
            resultAlert(title: "Draw")
        }
    }
    
    private func initBoard() {
        board.append(a1)
        board.append(a2)
        board.append(a3)
        board.append(b1)
        board.append(b2)
        board.append(b3)
        board.append(c1)
        board.append(c2)
        board.append(c3)
    }
    
    private func addToBoard(_ sender: UIButton) {
        if sender.title(for: .normal) == nil {
            if currentTurn == Symbol.Nought {
                sender.setTitle(nought, for: .normal)
                currentTurn = .Cross
                turnLabel.text = cross
            } else if currentTurn == Symbol.Cross {
                sender.setTitle(cross, for: .normal)
                currentTurn = .Nought
                turnLabel.text = nought
            }
            sender.isEnabled = false
        }
    }
    
    private func checkForVictory(_ symbol: String) -> Bool {
        if checkSymbol(a1, symbol) && checkSymbol(a2, symbol) && checkSymbol(a3, symbol) {
            return true
        }
        if checkSymbol(b1, symbol) && checkSymbol(b2, symbol) && checkSymbol(b3, symbol) {
            return true
        }
        if checkSymbol(c1, symbol) && checkSymbol(c2, symbol) && checkSymbol(c3, symbol) {
            return true
        }
        if checkSymbol(a1, symbol) && checkSymbol(b1, symbol) && checkSymbol(c1, symbol) {
            return true
        }
        if checkSymbol(a2, symbol) && checkSymbol(b2, symbol) && checkSymbol(c2, symbol) {
            return true
        }
        if checkSymbol(a3, symbol) && checkSymbol(b3, symbol) && checkSymbol(c3, symbol) {
            return true
        }
        if checkSymbol(a1, symbol) && checkSymbol(b2, symbol) && checkSymbol(c3, symbol) {
            return true
        }
        if checkSymbol(a3, symbol) && checkSymbol(b2, symbol) && checkSymbol(c1, symbol) {
            return true
        }
        return false
    }
    
    private func checkSymbol(_ button: UIButton, _ symbol: String) -> Bool {
        return button.title(for: .normal) == symbol
    }
    
    private func updateScore() {
        aISymbol.text = String("🤖: \(noughtsScore)")
        playerSymbol.text = String("👨🏻‍💻: \(crossesScore)")
    }

    private func resultAlert(title: String) {
        let alertMessage = "\nNoughts: " + String(noughtsScore) + "\n\nCrosses: " + String(crossesScore)
        let alertController = UIAlertController(title: title, message: alertMessage, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in
            self.resetBoard()
        }))
        self.present(alertController, animated: true)
    }
    
    private func fullBoard() -> Bool {
        for button in board {
            if button.title(for: .normal) == nil {
                return false
            }
        }
        return true
    }
    
    private func resetBoard() {
        for button in board {
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
        if firtsTurn == .Nought {
            firtsTurn = .Cross
            turnLabel.text = cross
        } else if firtsTurn == .Cross {
            firtsTurn = .Nought
            turnLabel.text = nought
        }
        currentTurn = firtsTurn
    }
    
    private func selectSymbol() {
        let alertMessage = "X or O"
        let alertController = UIAlertController(title: "Select Symbol", message: alertMessage, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "X", style: .default, handler: { _ in
            print("TestOne")
        }))
        alertController.addAction(UIAlertAction(title: "O", style: .default, handler: { _ in
            print("TestTwo")
        }))
        self.present(alertController, animated: true)
    }
}

