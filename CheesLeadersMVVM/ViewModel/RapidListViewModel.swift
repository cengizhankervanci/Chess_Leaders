//
//  BattleViewModel.swift
//  CheesLeadersMVVM
//
//  Created by Cengizhan Kervancı on 1.06.2023.
//

import Foundation


struct RapidListViewModel{
    
    let leadersRapid : LeadersModel!
    
    func leaderRapidCount() -> Int{
        leadersRapid.live_rapid.count
    }
    
    func leaderBattleBindWithIndex(index : Int) -> leaderBattle{
        let details = self.leadersRapid.live_rapid[index]
        return leaderBattle(specs: details)
    }
}

struct leaderBattle{
    
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
