//
//  SurveyViewController.swift
//  Survey
//
//  Created by Nathan Hopkins on 10/20/16.
//  Copyright © 2016 NathanHopkins. All rights reserved.
//

import UIKit

class SurveyViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var languageTextField: UITextField!
    
    
    @IBAction func sumbitButtonTapped (_ sender: UIButton) {
        
        guard let name = nameTextField.text,
            let language = languageTextField.text,
            !name.isEmpty && !language.isEmpty else { return }
        
        SurveyController.putSurveyIntoApi(name: name, language: language)
        
        nameTextField.text = ""
        languageTextField.text = ""
        
    }
    
    
}
