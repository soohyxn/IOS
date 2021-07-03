//
//  ViewController2.swift
//  Homework10
//
//  Created by 장수현 on 2021/05/04.
//

import UIKit

class ViewController2: UIViewController {
    @IBOutlet var youLabel: UILabel!
    @IBOutlet var meLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("eum")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("doo")
        
        var cards: [Card] = []
        youLabel.text = ""
        meLabel.text = ""

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

        cards.shuffle()
        for i in 0..<10 {
            if i<5 {
                youLabel.text?.append("\(cards[i].description())\n")
            } else {
                meLabel.text?.append("\(cards[i].description())\n")
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
