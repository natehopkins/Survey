//
//  LanguagesTableViewController.swift
//  Survey
//
//  Created by Nathan Hopkins on 10/20/16.
//  Copyright © 2016 NathanHopkins. All rights reserved.
//

import UIKit

class LanguagesTableViewController: UITableViewController {

    //============================
    //  Mark: - Properties
    //============================
    
    var results = [Survey]() {
        didSet{
            DispatchQueue.main.async {
                
                self.tableView.reloadData()
            }
        }
    }
    
    //============================
    //  Mark: - General
    //============================
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        SurveyController.fetchResults { (survey) in
            
            self.results = survey
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return results.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath)

        let result = results[indexPath.row]
        
        cell.textLabel?.text = result.language
        cell.detailTextLabel?.text = result.name
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

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
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
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
