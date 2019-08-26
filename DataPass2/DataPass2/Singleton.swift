//
//  Singleton.swift
//  DataPass2
//
//  Created by AnhDCT on 8/19/19.
//  Copyright © 2019 AnhDCT. All rights reserved.
//

import Foundation
class Singleton {
    
    static let sharedInstance = Singleton()
    
    var userInfo : String = ""
    
    private init() {
        
    }
}
