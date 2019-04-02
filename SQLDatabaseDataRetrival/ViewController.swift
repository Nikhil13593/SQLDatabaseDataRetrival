//
//  ViewController.swift
//  SQLDatabaseDataRetrival
//
//  Created by Nikhil Patil on 19/03/19.
//  Copyright © 2019 Nikhil Patil. All rights reserved.
//

import UIKit
import SQLite

var db:Connection!

class ViewController: UIViewController,UITableViewDelegate , UITableViewDataSource {
    
    //ViewController Variable
    
    var formVC:RegistrationFormViewController!
    
    @IBOutlet weak var tableViewCell: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createPath()
        createRetrieve()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //Creating Path for Data Base
    
    func createPath()
    {
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
            ).first!
        
        do
        {
            db = try Connection("\(path)/Details.sqlite3")
            print(path)
        }
        catch
        {
            print("Something Went Wrong")
        }
        
        do{
            try db.run("create table if not exists contacts(id integer primary key autoincrement, FirstName text, LastName text,Profession text)")
        }
        catch
        {
            print("Unable to Create a Table")
        }
    }
    //Mark : On tap go to next view controller
    @IBAction func addBtnTapped(_ sender: UIBarButtonItem) {
        
        formVC = self.storyboard?.instantiateViewController(withIdentifier: "RegistrationFormViewController") as! RegistrationFormViewController
        
        formVC.detailsVC = self
        self.navigationController?.pushViewController(formVC, animated: true)
        
    }
    
    //Table View DataSource
    //Number Of Rows In Section
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Details.shared.firstName.count
    }
    
    //Cell For Row at IndexPath
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        
        cell.firstNameLbl.text = Details.shared.firstName[indexPath.row]
        cell.lastNameLbl.text = Details.shared.lastName[indexPath.row]
        cell.professionLbl.text = Details.shared.professional[indexPath.row]
        
        cell.layer.borderWidth = 2
        cell.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        return cell
    }
    
    //Table View Delegate
    //Height For Row at IndexPath
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 210
    }
    
    //Retrieving the Data from Data Base
    
    func createRetrieve()
    {
        do{
            let statement = try db.run("SELECT * FROM contacts")
            
            for row in statement
            {
                
                Details.shared.firstName.append("\(row[1]!)")
                Details.shared.lastName.append("\(row[2]!)")
                Details.shared.professional.append("\(row[3]!)")
                
                print ("First Name :\(row[1]!)")
                print ("Last Name :\(row[2]!)")
                print ("Profession :\(row[3]!)")
                
                
            }
        }
        catch
        {
            print("Something is Wrong , Unable to Fetch")
        }
    }
    
}
