//
//  Devil Wizard.swift
//  rpgOOP
//
//  Created by Chad Wollenberg on 2/1/16.
//  Copyright © 2016 Chad Wollenberg. All rights reserved.
//

import Foundation

class DevilWizard: Enemy {
    override var loot: [String] {
        return ["Magic Wand","Dark Amulet","Salted Pork"]
    }
    
    override var type: String {
        return "Devil Wizard"
    }
}