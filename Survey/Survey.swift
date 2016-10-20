//
//  Survey.swift
//  Survey
//
//  Created by Nathan Hopkins on 10/20/16.
//  Copyright © 2016 NathanHopkins. All rights reserved.
//

import Foundation

struct Survey {
    
    //============================
    //  Mark: - Properties
    //============================
    
    let identifier: UUID
    let name: String
    let language: String
    
    var endpoint: URL? {
        
        
    }
    
    //============================
    //  Mark: - Initializers
    //============================
    
    init(identifier: UUID = UUID(), name: String, language: String) {
        
        self.identifier = identifier
        self.name = name
        self.language = language
    }
}

// JSON conversion support

extension Survey {
    
    //============================
    //  Mark: - Propreties
    //============================
    
    private static let keyName = "name"
    private static let keyLanguage = "language"
    
    // Provide a dictionary representation of this Survey Instance
    var jsonValue: [String: Any] {
        
        return [Survey.keyName: self.name, Survey.keyLanguage: self.language]
    }
    
    // Provide a JSON representation of a dictionary representation of this Survey instancd
    var jsonData: Data? {
        
        return try? JSONSerialization.data(withJSONObject: jsonValue, options: .prettyPrinted)
    }
    
    //============================
    //  Mark: - Initializers
    //============================
    
    init?(identifier: String, dictionary: [String: Any]) {
        
        // Converting from a dictionary into an instance of Survey
        
        guard let identifier = UUID(uuidString: identifier), let name = dictionary[Survey.keyName] as? String, let language = dictionary[Survey.keyLanguage] as? String else { return nil }
        
        self.identifier = identifier
        self.name = name
        self.language = language
    }
}
