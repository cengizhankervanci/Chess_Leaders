//
//  RushListViewModel.swift
//  CheesLeadersMVVM
//
//  Created by Cengizhan Kervancı on 1.06.2023.
//

import Foundation

struct RushListViewModel{
    
    let rushLeaders : LeadersModel!
    
    func leaderCount() -> Int{
        return rushLeaders.rush.count
    }
    
    func leaderRushBindWithIndex (index : Int) -> leaderRush{
        let rusherDetail = self.rushLeaders.rush[index]
        return leaderRush(specs: rusherDetail)
    }
}

struct leaderRush{
    
    let specs : LeaderInfo
    var username : String{
        return self.specs.username
    }
    
    var score : Int{
        return self.specs.score
    }
    
    var rank : Int{
        return self.specs.rank
    }
    
    var avatar : String{
        return self.specs.avatar
    }
    
    var win_count : Int{
        return self.specs.win_count
    }
    
    var loss_count : Int{
        return self.specs.loss_count
        
    }
    
    var draw_count : Int{
        return self.specs.draw_count
        
    }
}
