//
//  Core.swift
//  MyFramework
//
//  Created by Davide Bertola on 03/04/2017.
//  Copyright © 2017 Davide Bertola. All rights reserved.
//

import Foundation

@objc public class MyFramework: NSObject {
    
    public var optionalString:String? = nil
    
    @objc override public init() {
        super.init()
        self.optionalString = "optional string"
    }
    
    @objc public func doSomething() -> Bool {
        print("It works!", self.optionalString ?? "")
        return true
    }
    
}
