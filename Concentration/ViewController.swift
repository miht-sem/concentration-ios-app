//
//  ViewController.swift
//  Concentration
//
//  Created by Семен Михтанюк on 09.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        for button in self.buttonCollection {
            button.layer.cornerRadius = 30
            button.layer.masksToBounds = true
        }
        touchLabel.text = "Pairs Left: \(numberOfPairsOfCards)"
    }
    
    private lazy var game = ConcentartionGame(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
        return  (buttonCollection.count + 1) / 2
    }
    
    private var emojiCollection = ["🤖", "👾", "👽", "🤠", "👻", "🎃", "😶‍🌫️", "👺", "🫀", "🧠"]
    
    private var emojiDictionary = [Int:String]()
    
    private func emojiIdentifier(for card: Card) -> String{
        if emojiDictionary[card.indentifier] == nil {
            emojiDictionary[card.indentifier] = emojiCollection.remove(at: emojiCollection.count.arc4randomExtension)
        }
        return emojiDictionary[card.indentifier] ?? "?"
    }
    
    
    private func updateViewFromModel(){
        for index in buttonCollection.indices {
            let button = buttonCollection[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emojiIdentifier(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.3468109965, green: 0.3369802833, blue: 0.8698704839, alpha: 1)
            }
        }
        touchLabel.text = "Pairs Left: \(Int(game.cardsLeft))"
    }
    
    
    @IBOutlet private var buttonCollection: [UIButton]!
    @IBOutlet private weak var touchLabel: UILabel!
    @IBAction private func buttonAction(_ sender: UIButton) {
        if let buttonIndex = buttonCollection.firstIndex(of: sender) {
            game.chooseCard(at: buttonIndex)
            updateViewFromModel()
        }
    }
    
    
    
    
    
}

extension Int {
    var arc4randomExtension: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
