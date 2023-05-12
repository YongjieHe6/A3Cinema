//
//  PersonalViewController.swift
//  A3
//
//  Created by wd on 2023/5/10.
//

import UIKit

class PersonalViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var datasource: [Ticket] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        //TODO: get tikect data
        let testData = [
            ["movieID": "007","orderDate":"Today","movieShowTime":"14:44","endTime":"15:44","moviePrice":"39", "orderTotalPrice":"78","orderSeatNumbers":"35, 45","tips":"No.1"],
            ["movieID": "007","orderDate":"Today","movieShowTime":"17:44","endTime":"18:44","moviePrice":"55", "orderTotalPrice":"55","orderSeatNumbers":"36","tips":"No.1"],
            ["movieID": "007","orderDate":"Today","movieShowTime":"18:44","endTime":"19:44","moviePrice":"50", "orderTotalPrice":"50","orderSeatNumbers":"40, 42","tips":"No.1"],
            ["movieID": "007","orderDate":"Tomorrow","movieShowTime":"14:44","endTime":"15:44","moviePrice":"39", "orderTotalPrice":"78","orderSeatNumbers":"35, 36","tips":"No.1"],
            ["movieID": "007","orderDate":"Tomorrow","movieShowTime":"15:44","endTime":"16:44","moviePrice":"90", "orderTotalPrice":"90","orderSeatNumbers":"58, 60","tips":"No.1"],
            ["movieID": "007","orderDate":"Tomorrow","movieShowTime":"16:44","endTime":"17:44","moviePrice":"67", "orderTotalPrice":"67","orderSeatNumbers":"60","tips":"No.1"],
            ["movieID": "007","orderDate":"5-28","movieShowTime":"18:44","endTime":"19:44","moviePrice":"46", "orderTotalPrice":"46","orderSeatNumbers":"35","tips":"No.1"],
            ["movieID": "007","orderDate":"5-28","movieShowTime":"20:44","endTime":"21:44","moviePrice":"79", "orderTotalPrice":"79","orderSeatNumbers":"67","tips":"No.1"],
            ["movieID": "007","orderDate":"5-28","movieShowTime":"14:44","endTime":"15:44","moviePrice":"90", "orderTotalPrice":"90","orderSeatNumbers":"85","tips":"No.1"],
            ["movieID": "007","orderDate":"5-29","movieShowTime":"14:44","endTime":"15:44","moviePrice":"55", "orderTotalPrice":"55","orderSeatNumbers":"45","tips":"No.1"],
            ["movieID": "007","orderDate":"5-29","movieShowTime":"16:44","endTime":"17:44","moviePrice":"78", "orderTotalPrice":"78","orderSeatNumbers":"60","tips":"No.1"],
            ["movieID": "007","orderDate":"5-29","movieShowTime":"21:44","endTime":"22:44","moviePrice":"50", "orderTotalPrice":"50","orderSeatNumbers":"35","tips":"No.1"]
        ]
    
        do {
            let data = try JSONSerialization.data(withJSONObject: testData, options: [])
            
            let models = try JSONDecoder().decode([Ticket].self, from: data)
            datasource = models
            tableView.reloadData()
        } catch {
               fatalError("Couldn't load \(testData) ")
        }
    }
    
    @IBAction func onClickedLogout(_ sender: Any) {
        
        let alet = UIAlertController(title: "Sure to Log Out?", message: nil, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Sure", style: .default) { action in
            
            if let window = UIApplication.shared.connectedScenes.first?.value(forKeyPath:"delegate.window") as? UIWindow {
                
                let loginViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController")
                let navigationController = UINavigationController(rootViewController: loginViewController)
                window.rootViewController = navigationController
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alet.addAction(okAction)
        alet.addAction(cancelAction)
        present(alet, animated: true)
    }
}

extension PersonalViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }
        
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalHeaderTableViewCell", for: indexPath)
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalTiketsCell", for: indexPath)
        
        if let ticketCell = cell as? PersonalTiketsCell, datasource.count > indexPath.row {
            
            let ticket = datasource[indexPath.row]
            
            ticketCell.timeLabel.text = "\(ticket.orderDate) \(ticket.movieShowTime)"
            ticketCell.seatNumberLabel.text = ticket.orderSeatNumbers
            ticketCell.totalPriceLabel.text = "$\(ticket.orderTotalPrice ?? "0")"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        if indexPath.section == 1 {
            return true
        }
        
        return false
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        guard indexPath.section == 1, editingStyle == .delete else {
            return
        }
        
        guard datasource.count > indexPath.row else {
            return
        }
        
        let alet = UIAlertController(title: "You sure to delete this ticket?", message: nil, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Sure", style: .default) { action in
            
            self.datasource.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alet.addAction(okAction)
        alet.addAction(cancelAction)
        present(alet, animated: true)
    }
}
