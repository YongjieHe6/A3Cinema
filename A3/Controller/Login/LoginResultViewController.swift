//
//  LoginResultViewController.swift
//  A3
//
//  Created by wd on 2023/5/10.
//

import UIKit

class LoginResultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func gotoMoviesHome(_ sender: Any) {
        
        if let window = UIApplication.shared.connectedScenes.first?.value(forKeyPath:"delegate.window") as? UIWindow {
            
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieTabBarController")
            window.rootViewController = vc
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
