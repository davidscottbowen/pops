//
//  LoginViewController.swift
//  pops
//
//  Created by Scott Bowen on 2/21/20.
//  Copyright © 2020 Scott Bowen. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class LoginViewController: UIViewController {
    
     var handle: AuthStateDidChangeListenerHandle?
    
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      // [START auth_listener]
      handle = Auth.auth().addStateDidChangeListener { (auth, user) in
        // [START_EXCLUDE]
        if Auth.auth().currentUser != nil {
          // User is signed in.
          // ...
            self.statusLabel.text = "User is signed in"
        } else {
          // No user is signed in.
          // ...
        }
        // [END_EXCLUDE]
      }
      // [END auth_listener]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emailTextField.placeholder = "Email"
        passwordTextField.placeholder = "Password"
        
    }
    
    @IBAction func loginButton(_ sender: Any) {
        login(withEmail: emailTextField.text!, password: passwordTextField.text!)
    }
    
    @IBAction func registerButton(_ sender: Any) {
        createUser(email: emailTextField.text!, password: passwordTextField.text!)

    }
    
    func showAlert(message:String)
    {
    let alert = UIAlertController(title: message, message: "", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    self.present(alert, animated: true)
    }
        
    func createUser(email: String, password: String, _ callback: ((Error?) -> ())? = nil){
          Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
              if let e = error{
                  callback?(e)
                  return
              }
              callback?(nil)
        }
        let alertController = UIAlertController(title: "iOScreator", message:
            "Hello, world!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))

        self.present(alertController, animated: true, completion: nil)
    }
    
    func login(withEmail email: String, password: String, _ callback: ((Error?) -> ())? = nil){
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let e = error{
                callback?(e)
                return
            }
            callback?(nil)
        }
    }
    
    func signOut() {
            let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
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
