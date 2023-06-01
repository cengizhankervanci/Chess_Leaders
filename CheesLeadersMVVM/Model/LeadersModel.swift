//
//  LeadersModel.swift
//  CheesLeadersMVVM
//
//  Created by Cengizhan Kervancı on 1.06.2023.
//

import Foundation

struct LeadersModel : Codable{
    var daily : [LeaderInfo]
    var battle : [LeaderInfo]
    var rush : [LeaderInfo]
}

struct LeaderInfo : Codable{
    let username : String
    let score : Int
    let rank : Int
    let avatar : String
    let win_count : Int
    let loss_count : Int
    let draw_count : Int
}
