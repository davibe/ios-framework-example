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
    
    @objc public func doReadResource() -> String? {
        let bundle = Bundle(for: MyFramework.self)
        let filePath = bundle.path(forResource: "main", ofType: "js")!
        
        func readFile(filePath:String) -> String? {
            do {
                let fileContent = try String(contentsOfFile: filePath)
                return fileContent
            } catch {}
            
            return nil
        }
        
        return readFile(filePath: filePath)
    }
}
