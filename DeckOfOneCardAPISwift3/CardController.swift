//
//  CardController.swift
//  DeckOfOneCardAPISwift3
//
//  Created by Patrick Pahl on 10/17/16.
//  Copyright © 2016 Patrick Pahl. All rights reserved.
//

import Foundation

class CardController {
    
    static let baseURL = URL(string: "https://deckofcardsapi.com/api/deck/new/draw/")
    
    static func draw(numberOfCards: Int, completion: @escaping ((_ card: [Card]) -> Void)) {
        //completion: @escaping
        
        //NC: Create/send request
        //NC: Wait for response
        //Here: serialize into Card instances
        //Here" Run the completion, passing along the resulting array of Card instances
        
        guard let url = self.baseURL else {
            fatalError("URL optional is nil")
        }
        
        let urlParameters = ["count": "\(numberOfCards)"]
        
        //Call NetworkController
        
        NetworkController.performRequest(for: url, httpMethod: .Get, urlParameters: urlParameters, body: nil) { (data, error) in
            
            if let error = error {
                NSLog("Error with request: \(error.localizedDescription)")
                completion([])
                return
            }
            
            guard let data = data,
                let responseDataString = String(data: data, encoding: .utf8) else {
                    completion([])
                    NSLog("No data returned from data request")
                    return
            }
            
            //Serialize results into Card instances
            
            guard let responseDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String: AnyObject],
                let cardDictionaries = responseDictionary["cards"] as? [[String: AnyObject]]  else {
                    //array of dicts
                    NSLog("Unable to serialize. Response: \(responseDataString)")
                    completion([])
                    return
            }
            
            let cards = cardDictionaries.flatMap({ Card(dictionary: $0)})
            //failable init makes these for us
            completion(cards)
        }
    }
}



