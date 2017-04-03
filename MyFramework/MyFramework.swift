//
//  Core.swift
//  MyFramework
//
//  Created by Davide Bertola on 03/04/2017.
//  Copyright © 2017 Davide Bertola. All rights reserved.
//

import Foundation

public class MyFramework {
    
    public var optionalString:String? = nil
    
    public init() {
        self.optionalString = "optional string"
    }
    
    public func doSomething() -> Bool {
        print("It works!", self.optionalString ?? "")
        return true
    }
    
}
