//
//  Ticket.swift
//  A3
//
//  Created by 何永洁 on 7/5/2023.
//

import Foundation
import UIKit

class Ticket:NSObject,NSCoding,Codable{
    
    var movieID:String
    var orderDate:String
    var movieShowTime:String
    var moviePrice:String
    var orderSeatNumbers:String?
    var orderTotalPrice:String?
    
    override init() {
        movieID = ""
        orderDate = ""
        movieShowTime = ""
        moviePrice = ""
        orderSeatNumbers = ""
        orderTotalPrice = ""
    }
    
    required init?(coder: NSCoder) {
        movieID = coder.decodeObject(forKey: "movieID") as! String
        orderDate = coder.decodeObject(forKey: "orderDate") as! String
        movieShowTime = coder.decodeObject(forKey: "movieShowTime") as! String
        moviePrice = coder.decodeObject(forKey: "moviePrice") as! String
        orderSeatNumbers = coder.decodeObject(forKey: "orderSeatNumbers") as? String
        orderTotalPrice = coder.decodeObject(forKey: "orderTotalPrice") as? String
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(movieID, forKey: "movieID")
        coder.encode(orderDate, forKey: "orderDate")
        coder.encode(movieShowTime, forKey: "movieShowTime")
        coder.encode(moviePrice, forKey: "moviePrice")
        coder.encode(orderSeatNumbers, forKey: "orderSeatNumbers")
        coder.encode(orderTotalPrice, forKey: "orderTotalPrice")
    }
    
    
    
    
}
