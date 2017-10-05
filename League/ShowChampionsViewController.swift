//
//  ShowChampionsViewController.swift
//  League
//
//  Created by Mohit Sadhu on 9/16/17.
//  Copyright © 2017 Mohit Sadhu. All rights reserved.
//

import UIKit

class ShowChampionsViewController: UIViewController {

    var allChampions = [ChampionViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        getChampionsStatic()
    }

    func getChampionsStatic() {
        let url: URL! = URL.init(string: "https://na1.api.riotgames.com/lol/static-data/v3/champions?locale=en_US&dataById=false")
        var urlRequest = URLRequest.init(url: url)
        urlRequest.addValue("RGAPI-988e870d-ecbb-4b7d-b1df-1d67af6f3bce", forHTTPHeaderField: "X-Riot-Token")
        urlRequest.addValue("application/x-www-form-urlencoded; charset=UTF-8", forHTTPHeaderField: "Accept-Charset")
        urlRequest.addValue("https://developer.riotgames.com", forHTTPHeaderField: "Origin")
        
        let session = URLSession.init(configuration: .default)
        let datatask = session.dataTask(with: urlRequest) {
            (data, response, error) in
            
            if let error = error {
                print("Error : %@", error)
            }
            do {
                if let jsonData = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as? Dictionary<String, AnyObject> {
                    
                    if let allData = jsonData["data"] as? Dictionary<String, AnyObject> {
                        print("All Data: \n %@", allData)
                     
                        self.dumpChampions(champions: allData)
                    }
                }
                
            } catch let error  {
                print("json error: %@", error)
            }
        }
        
        datatask.resume()
    }
    
    func dumpChampions(champions: Dictionary<String, AnyObject>) {
        
        for (type, value) in champions {
            if let champ = value as? Dictionary<String, AnyObject> {
                print("Champ: \(champ)")
                
                guard
                    let name = champ["name"] as? String,
                    let title = champ["title"] as? String,
                    let champId = champ["id"] as? NSNumber
                    else {
                        return
                    }

                allChampions.append(ChampionViewModel.initWith(name: name, id: champId, title: title))
            }
            print("Type: \(type)   -- Value: \(value)")
        }
        print("All champs: \(allChampions)")
        
        //Sorting champions by ID value in increasing order
        let allChampionsbyId = allChampions.sorted { (v1, v2) -> Bool in
            v1.championId.intValue < v2.championId.intValue
        }
        print("Sorted champs by ID: \n \(allChampionsbyId)")
        
        //Sorting champions by NAME value in increasing order
        let allChampionsAlphabetically = allChampions.sorted { (v1, v2) -> Bool in
            v1.championName.compare(v2.championName) == .orderedAscending
        }
        print("Sorted champs by NAME: \n \(allChampionsAlphabetically)")
    }

}
