//
//  Movie.swift
//  A3
//
//  Created by 何永洁 on 7/5/2023.
//

import Foundation
import UIKit

struct Movie:Hashable, Codable{
    var movieID:String
    var movieClassification:String //0 means currently released, 1 means upcoming release
    var movieName:String
    var movieImage:Int
    var movieShowTime:String
    var movieRunningTime:String
}
