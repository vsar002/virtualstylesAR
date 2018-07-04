//
//  LoginViewController.swift
//  AugmentedRealityTest
//
//  Created by Semen Letychevskyy on 01.07.18.
//  Copyright © 2018 Anonymer Eintrag. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController, UITextFieldDelegate {

    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.delegate = self
        passwordTextField.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func signinTaped(_ sender: UIButton) {
        if (emailTextField != nil && emailTextField.text != "" && passwordTextField != nil && passwordTextField.text != ""){
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { user, error in
                if error == nil && user != nil {
                    print("User signed in!")
                    
                    
                    if Auth.auth().currentUser != nil{
                        self.dismiss(animated: false, completion: nil)
                    }
                    
                } else {
                    self.loginError()
                }
            }
        } else {
            textFieldNotFilled()
        }
    }
    
    func textFieldNotFilled(){
        let alert = UIAlertController(title: "Textfield not filled!", message: "Please, properly fill all the textfields", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func loginError(){
        let alert = UIAlertController(title: "Error logging in", message: "Please try again later", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func emailTextFieldReturnTaped(_ sender: Any) {
        emailTextField.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        self.emailTextField.endEditing(true)
        self.passwordTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(emailTextField: UITextField) -> Bool {
        
        emailTextField.resignFirstResponder()
        
        //or
        //self.view.endEditing(true)
        
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        emailTextField.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
