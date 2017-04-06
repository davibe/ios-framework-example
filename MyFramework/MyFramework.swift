//
//  Core.swift
//  MyFramework
//
//  Created by Davide Bertola on 03/04/2017.
//  Copyright © 2017 Davide Bertola. All rights reserved.
//

import Foundation
import JavaScriptCore
import Observable


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
    
    @objc public func doExecuteJavascript() -> String? {
        let jsVm = JSVirtualMachine()
        let jsContext = JSContext(virtualMachine: jsVm)
        let scriptSource = self.doReadResource()
        jsContext?.evaluateScript(scriptSource)
        let jsValue = jsContext?.evaluateScript("test()")
        let result = jsValue?.toString()
        return result
    }
    
    @objc public func doObserveValue(
        observer: ((_ before:Int, _ after:Int) -> Void)?
    ) -> Int {
        var x = Observable<Int>(0)
        let subscription = x.afterChange += observer!
        x <- 4
        return x.value
    }
}
