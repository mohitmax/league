//
//  ChampionViewModel.swift
//  League
//
//  Created by Mohit Sadhu on 10/4/17.
//  Copyright © 2017 Mohit Sadhu. All rights reserved.
//

import UIKit

class ChampionViewModel: NSObject {
    
    var championName: String!
    var championId: NSNumber!
    var championTitle: String!
    
    override init() {
        super.init()
        
        championName = ""
        championId = -1
        championTitle = ""
    }
    
    class func initWith(name: String, id: NSNumber, title: String) -> ChampionViewModel {
        
        let viewModel = ChampionViewModel.init()
        
        viewModel.championName = name
        viewModel.championTitle = title
        viewModel.championId = id
        
        return viewModel
    }

}
