//
//  File.swift
//  Survey
//
//  Created by Nathan Hopkins on 10/20/16.
//  Copyright © 2016 NathanHopkins. All rights reserved.
//

import Foundation

class SurveyController {
    
    //============================
    //  Mark: - Propreties
    //============================
    
    static let baseURL = URL(string: "https://cslanguagesurvey-9c552.firebaseio.com/api/survey")
    
    static let getAllSurveysEndpoint = baseURL?.appendingPathExtension("json")
    
    //============================
    //  Mark: - Methods
    //============================
    
    static func putSurveyIntoApi(name: String, language: String) {
        
        // Create an instance
        
        let survey = Survey(name: name, language: language)
        
        // Unwrap our URL
        
        guard let putEndpointURL = survey.putEndpoint else { return }
        
        // Make the PUT request
        
        NetworkController.performRequest(for: putEndpointURL, httpMethod: .Put, body: survey.jsonData) { (data, error) in
            
            let responseDataString = String(data: data!, encoding: .utf8) ?? ""
            
            if error != nil {
                NSLog("Error: \(error?.localizedDescription)")
            } else if responseDataString.contains("error") {
                NSLog("Error: \(responseDataString)")
            } else {
                NSLog("Successfully saved data to the PUT endpoint. \nResponse: \(responseDataString)")
            }
        }
    }
}
