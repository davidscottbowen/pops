//
//  LoginViewController.swift
//  pops
//
//  Created by Scott Bowen on 2/21/20.
//  Copyright © 2020 Scott Bowen. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emailTextField.placeholder = "Email"
        passwordTextField.placeholder = "Password"
        
    }
    
    
    
    @IBAction func loginButton(_ sender: Any) {
        
    }
    
    
    @IBAction func registerButton(_ sender: Any) {
        
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
