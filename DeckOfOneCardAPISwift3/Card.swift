//
//  Card.swift
//  DeckOfOneCardAPISwift3
//
//  Created by Patrick Pahl on 10/17/16.
//  Copyright © 2016 Patrick Pahl. All rights reserved.
//

import Foundation

class Card {
    
    private let imageEndpointKey = "image"
    private let valueKey = "value"
    private let suitKey = "suit"
    
    let imageEndpoint: String
    let value: String
    let suit: String
    
    //Init
    
    init(imageEndpoint: String, value: String, suit: String) {
        
        self.imageEndpoint = imageEndpoint
        self.value = value
        self.suit = suit
    }
    
    //failable init
    
    init?(dictionary: [String: Any]) {
        
        guard let imageEndpoint = dictionary[imageEndpointKey] as? String,
        let value = dictionary[valueKey] as? String,
        let suit = dictionary[suitKey] as? String else {return nil}
        
        self.imageEndpoint = imageEndpoint
        self.value = value
        self.suit = suit
    }
}
