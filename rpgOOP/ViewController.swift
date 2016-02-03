//
//  ViewController.swift
//  rpgOOP
//
//  Created by Chad Wollenberg on 2/1/16.
//  Copyright © 2016 Chad Wollenberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var printLbl: UILabel!
    @IBOutlet weak var chestLbl: UIButton!
    @IBOutlet weak var heroLbl: UILabel!
    @IBOutlet weak var enemyHPLbl: UILabel!
    @IBOutlet weak var enemyImg: UIImageView!
    
    var player: Player!
    var enemy: Enemy!
    var chestMsg: String? = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player = Player(name: "DirtyLaundry21", hp: 110, attackPwr: 20)
        
        generateRandomEnemy()
        
        heroLbl.text = "\(player.hp) HP"
    }
    
    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            enemy = Kimara (startingHP: 50, attackPwr: 12)
        } else {
            enemy = DevilWizard (startingHP: 60, attackPwr: 15)
        }
    }
    
    @IBAction func onChestPressed(sender: AnyObject) {
        chestLbl.hidden = true
        printLbl.text = chestMsg
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "generaterandomenemy", userInfo: nil, repeats: false)
        
        
        
    }
    
    @IBAction func onAttackPressed(sender: AnyObject) {
        if enemy.attemptAttack(player.attackPower){
            printLbl.text = "Attacked \(enemy.type) for \(player.attackPower) HP"
            enemyHPLbl.text = "\(enemy.hp) HP"
        } else {
           
            printLbl.text = "Attack was unsuccessful!"
        }
        if let loot = enemy.dropLoot() {
            player.addItemToInventory(loot)
            chestMsg = "\(player.name) found \(loot)!"
            chestLbl.hidden = false
        }
        
        if !enemy.isAlive {
            enemyHPLbl.text = ""
            printLbl.text = "Killed \(enemy.type)!"
            enemyImg.hidden = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

