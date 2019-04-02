//
//  Details.swift
//  SQLDatabaseDataRetrival
//
//  Created by Nikhil Patil on 19/03/19.
//  Copyright © 2019 Nikhil Patil. All rights reserved.
//

import UIKit

class Details: NSObject {

    static var shared = Details()
    var firstName = [String]()
    var lastName = [String]()
    var professional = [String]()
    
    private override init() {
        
    }
}
