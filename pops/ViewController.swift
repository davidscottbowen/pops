//
//  ViewController.swift
//  pops
//
//  Created by Scott Bowen on 2/18/20.
//  Copyright © 2020 Scott Bowen. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    var textOut : String!
    
    var ref : DatabaseReference!
    
    var databaseRefer : DatabaseReference!
    var databaseHandle : DatabaseHandle!
    
    @IBOutlet weak var textOutput: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textOutput.text = ""
    }

    
    @IBAction func submit(_ sender: Any) {
        print("Submit button tapped")
        
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date / server String
        formatter.dateFormat = "MM-dd-yyyy HH:mm:ss"

        let myString = formatter.string(from: Date()) // string purpose I add here
        // convert your string to date
        let yourDate = formatter.date(from: myString)
        //then again set the date format whhich type of output you need
        formatter.dateFormat = "MM-dd-yyyy HH:mm:ss"
        // again convert your date to string
        let myStringafd = formatter.string(from: yourDate!)

        print(myStringafd)
        
        
        
        databaseRefer = Database.database().reference()
//        databaseRefer.child("name").childByAutoId().setValue("Visal")
//        databaseRefer.child("name").childByAutoId().setValue("Phanith")
//        databaseRefer.child("name").childByAutoId().setValue(myStringafd)
        databaseRefer.child("Date").child(myStringafd).setValue(myStringafd)
        
        
         
        databaseHandle = databaseRefer.child("Date").observe(.childAdded, with: { (data) in
            let name: String = (data.value as? String)!
            self.textOutput.text = name
            debugPrint(name)
        })
        
        
//         let ref = Database.database().reference().child("users/scott")
//
//
//         ref.observeSingleEvent(of: .value, with: { (snap : DataSnapshot)  in
//
//             print("\(String(describing:  snap.value))")
//
//         }) { (err: Error) in
//
//
//             print("\(err.localizedDescription)")
//
//
//
//        }
            
        
    }
    
    

}

