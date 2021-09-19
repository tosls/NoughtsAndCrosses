//
//  MainMenuViewController.swift
//  NoughtsAndCrosses
//
//  Created by Антон Бобрышев on 19.09.2021.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    @IBOutlet weak var gameType: UISegmentedControl!
    
    private var selectedGameType: GameType {
        if gameType.selectedSegmentIndex == 1 {
            return GameType.pve
        }
        return GameType.pvp
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let gameBoardVC = segue.destination as? GameBoardViewController else {return}
        gameBoardVC.gameType = selectedGameType
    }
    
    @IBAction func NewGameButtonTapped() {
    }
}
