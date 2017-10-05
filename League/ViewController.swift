//
//  ViewController.swift
//  League
//
//  Created by Mohit Sadhu on 9/16/17.
//  Copyright © 2017 Mohit Sadhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var leagueTitleLabel: UILabel!
    @IBOutlet var showChampionsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        leagueTitleLabel.text = "League of Legends"
        
    }

    @IBAction func showChampions() {
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

