//
//  RegistrationFormViewController.swift
//  SQLDatabaseDataRetrival
//
//  Created by Nikhil Patil on 19/03/19.
//  Copyright © 2019 Nikhil Patil. All rights reserved.
//

import UIKit

class RegistrationFormViewController: UIViewController {

    //ViewController Variable
    
    var detailsVC:ViewController!
    
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var professionalTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    //Save Button Tap Condition
    
    @IBAction func onSaveBtnTap(_ sender: Any) {
        
        do{
            try db.run("insert into contacts(FirstName,LastName,Profession)values (?,?,?)",firstNameTF.text!,lastNameTF.text!,professionalTF.text!)
            
            Details.shared.firstName = []
            Details.shared.lastName = []
            Details.shared.professional = []
            
            detailsVC.createRetrieve()
            detailsVC.tableViewCell.reloadData()
            
            navigationController?.popToRootViewController(animated: true)
        }
        catch
        {
            print("Unable to Save the Data")
        }
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

}
