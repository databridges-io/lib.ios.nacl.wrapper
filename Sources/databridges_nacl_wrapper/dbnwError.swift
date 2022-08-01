//
//  File.swift
//  
//
//  Created by mac on 28/07/22.
//

import Foundation


public class dbnwError : Error
{
    public var  source: String = "DBLIB_NACL_WRAPPER"
    public var  code: String = ""
    public var  message: String = ""
    
    public init (_ codeext: String = "",  _ message:String = "") {
        self.code = codeext
        self.message = message
    }
    
}
