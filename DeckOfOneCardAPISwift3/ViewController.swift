//
//  ViewController.swift
//  DeckOfOneCardAPISwift3
//
//  Created by Patrick Pahl on 10/17/16.
//  Copyright © 2016 Patrick Pahl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func drawCardButtonTapped(_ sender: AnyObject) {
        
        CardController.draw(numberOfCards: 1) { (cards) in
            guard let card = cards.first else {return}
            
            imageController.image(forURL: card.imageEndpoint, completion: { (image) in
                guard let image = image else {return}
                self.cardImageView.image = image
            })
        }
    }
    
    @IBOutlet weak var cardImageView: UIImageView!

}

