//
//  LoginViewController.swift
//  A3
//
//  Created by wd on 2023/5/10.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let nameStored = UserDefaults.standard.string(forKey: UserDefaultsNameUser), let pwdStored = UserDefaults.standard.string(forKey: UserDefaultsNamePassword) {
            
            userNameTextField.text = nameStored
            passwordTextField.text = pwdStored
        }
    }
    
    @IBAction func unwindToLogin(_ unwindSegue: UIStoryboardSegue) {
//        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }
    
    @IBAction func unwindToLoginWhenRegisterSuccess(_ unwindSegue: UIStoryboardSegue) {
        
        if let sourceViewController = unwindSegue.source as? RegisterResultViewController {
            
            userNameTextField.text = sourceViewController.userName
            passwordTextField.text = sourceViewController.password
        }
        // Use data from the view controller which initiated the unwind segue
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier == "prepareLogin" {
            
            //start login
            guard let name = userNameTextField.text, !name.isEmpty else {
                errorLabel.text = "Please enter user name"
                errorLabel.isHidden = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                    self.errorLabel.isHidden = true
                })
                return false
            }
            
            guard let password = passwordTextField.text, !password.isEmpty else {
                errorLabel.text = "Please enter password"
                errorLabel.isHidden = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                    self.errorLabel.isHidden = true
                })
                return false
            }
            
            guard let nameStored = UserDefaults.standard.string(forKey: UserDefaultsNameUser), let pwdStored = UserDefaults.standard.string(forKey: UserDefaultsNamePassword), nameStored == name, pwdStored == password else {
                
                errorLabel.text = "Login failed, wrong name or password"
                errorLabel.isHidden = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                    self.errorLabel.isHidden = true
                })
                return false
            }
            
            //hide back login item
            self.navigationItem.leftBarButtonItem = nil
            
            return true
        }
        
        return true
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
