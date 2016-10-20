//
//  SurveyTableViewController.swift
//  Survey
//
//  Created by Nathan Hopkins on 10/20/16.
//  Copyright © 2016 NathanHopkins. All rights reserved.
//

import UIKit

class SurveyTableViewController: UITableViewController {

    //============================
    //  Mark: - Properties
    //============================
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var languageTextField: UITextField!
    
    
    //============================
    //  Mark: - General
    //============================
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //============================
    //  Mark: - Actions
    //============================
    
    @IBAction func submittButtonTapped(_ sender: UIButton) {
        nameTextField.resignFirstResponder()
        languageTextField.resignFirstResponder()
        
        guard let name = nameTextField.text, let language = languageTextField.text, !name.isEmpty && !language.isEmpty else { return }
        
        SurveyController.putSurveyIntoApi(name: name, language: language)
        
        nameTextField.text = ""
        languageTextField.text = ""
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }


    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
