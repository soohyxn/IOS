//
//  ViewController2.swift
//  Homework10
//
//  Created by 장수현 on 2021/05/04.
//

import UIKit

class ViewController2: UIViewController {
    @IBOutlet var youName: UILabel!
    @IBOutlet var youLabel: UILabel!
    @IBOutlet var meLabel: UILabel!
    var cards: [Card] = []
    var nameString: String?
    var youScore: Int = 0
    var meScore: Int = 0
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tempController = segue.destination as? ViewController3 else {
            return
        }
        if youScore < meScore {
            tempController.resultString = "You Loose!"
        } else {
            tempController.resultString = "You Win!"
        }
        
        tempController.scoreString = "Your score:\(youScore) / My score:\(meScore)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("eum")
        
        youName.text = nameString

        for i in 1...4 {
            for j in 1...13 {
                let s = Suit(rawValue: i)
                let r = Rank(rawValue: j)
                
                if let s = s {
                    if let r = r {
                        let card = Card(suit: s, rank: r)
                        card.flip()
                        cards.append(card)
                    }
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("doo")
        
        youLabel.text = ""
        meLabel.text = ""
        
        youScore = 0
        meScore = 0
        
        cards.shuffle()
        for i in 0..<10 {
            if i<5 {
                youLabel.text?.append("\(cards[i].description())\n")
                youScore += cards[i].suit.rawValue * cards[i].rank.rawValue
            } else {
                meLabel.text?.append("\(cards[i].description())\n")
                meScore += cards[i].suit.rawValue * cards[i].rank.rawValue
            }
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("hun")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
}
