//
//  UsefulMethods.swift
//  A3
//
//  Created by 何永洁 on 7/5/2023.
//


import UIKit
import Foundation

let UserDefaultsNameUser = "UserDefaultsNameUser"
let UserDefaultsNamePassword = "UserDefaultsNamePassword"

let ticketsPath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("tickets.plist")


func loadJson<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

func JSONDictModel<T: Decodable>(_ data:[String:Any],  as type: T.Type = T.self)-> T {

    let data2: Data
    do{
        data2 = try JSONSerialization.data(withJSONObject: data, options: [])
    }catch{
           fatalError("Couldn't load \(data) ")
    }
   
    do{
         let model = try JSONDecoder().decode(type, from: data2)
           return model
    }catch{
        fatalError("Couldn't parse \(data) as \(T.self):\n\(error)")
    }

}

func JSONArryModel<T: Decodable>(_ datas: [[String:Any]],as type: T.Type = T.self)-> [T]{

    var temp: [T] = []
    for data in datas {
        let model:T = JSONDictModel(data)
       temp.append(model)
    }
    return temp
}

