//
//  RegisterViewController.swift
//  A3
//
//  Created by wd on 2023/5/10.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var userErrorLabel: UILabel!
    
    @IBOutlet weak var pwdErrorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier == "prepareSignUp" {
            
            //start register
            guard let name = userNameTextField.text, !name.isEmpty else {
                userErrorLabel.isHidden = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                    self.userErrorLabel.isHidden = true
                })
                return false
            }
            
            guard let password = passwordTextField.text, !password.isEmpty else {
                pwdErrorLabel.isHidden = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                    self.pwdErrorLabel.isHidden = true
                })
                return false
            }
            
            return true
        }
        
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "prepareSignUp", let destination = segue.destination as? RegisterResultViewController {
            
            destination.userName = userNameTextField.text
            destination.password = passwordTextField.text
            destination.registerResult = "Sign Up Success!"
            
            //store user name and password
            UserDefaults.standard.set(destination.userName, forKey: UserDefaultsNameUser)
            UserDefaults.standard.set(destination.password, forKey: UserDefaultsNamePassword)
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
