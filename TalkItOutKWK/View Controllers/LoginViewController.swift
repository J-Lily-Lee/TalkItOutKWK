//
//  LoginViewController.swift
//  TalkItOutKWK
//
//  Created by Lily Lee on 1/28/21.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    
    @IBOutlet weak var usernameTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpElements()
    }
    

    func setUpElements(){
        
        //Hide the error label
        
        errorLabel.alpha = 0
        
        //Style the elements
        
        Utilities.styleTextField(usernameTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
    }

    

    
    @IBAction func loginTapped(_ sender: Any) {
        
        //Validate Text Fields
        
        //Create cleaned versions of the text field
        let email = usernameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password =
            passwordTextField.text!.trimmingCharacters(in:.whitespacesAndNewlines)
        
        //Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) {(result,error) in
            
            if error != nil {
                //Couldn't sign in
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            }
            else {
                
                let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
                
                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
        
        
    }
    
}
