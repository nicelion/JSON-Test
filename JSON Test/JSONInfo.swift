//
//  JSONInfo.swift
//  JSON Test
//
//  Created by Ian Thompson on 12/20/15.
//  Copyright © 2015 Ian Thompson. All rights reserved.
//

import Foundation
import UIKit

class JSONInfo {
    
    
    var title: String?
    var description: String?
    var url: String?
    var image: String?
    
    var isBlue: Bool?
    
    
    init(json: NSDictionary){
        
        self.title = json["post-title"] as? String
        self.description = json["post-description"] as? String
        self.url = json["link"] as? String
        self.image = json["post-image"] as? String
        
        self.isBlue = json["isBlue"] as? Bool
        
    }
    
    
    
}
