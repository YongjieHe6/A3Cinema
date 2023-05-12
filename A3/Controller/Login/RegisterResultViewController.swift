//
//  RegisterResultViewController.swift
//  A3
//
//  Created by wd on 2023/5/10.
//

import UIKit

class RegisterResultViewController: UIViewController {

    @IBOutlet weak var registerResultLabel: UILabel!
    
    var userName: String?
    var password: String?
    var registerResult: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        registerResultLabel.text = registerResult
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
