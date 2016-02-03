//
//  Kimara.swift
//  rpgOOP
//
//  Created by Chad Wollenberg on 2/1/16.
//  Copyright © 2016 Chad Wollenberg. All rights reserved.
//

import Foundation

class Kimara: Enemy {
    
    let IMMUNE_MAX = 15
    
    override var loot: [String] {
        return ["Tough Hide", "Kimara Venom", "Rare Trident"]
    }
    
    override var type: String {
        return "Kimara"
    }
    
    override func attemptAttack(attackPwr: Int) -> Bool {
        if attackPwr >= IMMUNE_MAX {
            return super.attemptAttack(attackPower)
        } else {
            return false 
        }
    }
}