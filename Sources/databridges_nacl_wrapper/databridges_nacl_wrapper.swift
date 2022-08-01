//
//        DataBridges Swift NaCl wrapper for databridges library.
//        https:#www.databridges.io/ 
//
//        Copyright 2022 Optomate Technologies Private Limited.
//        
//        Permission is hereby granted, free of charge, to any person obtaining
//        a copy of this software and associated documentation files (the
//        "Software"), to deal in the Software without restriction, including
//        without limitation the rights to use, copy, modify, merge, publish,
//        distribute, sublicense, and/or sell copies of the Software, and to
//        permit persons to whom the Software is furnished to do so, subject to
//        the following conditions:
//        
//        The above copyright notice and this permission notice shall be
//        included in all copies or substantial portions of the Software.
//        
//        THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//        EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//        MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//        NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
//        LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
//        OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
//        WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. 
// 
//
import Foundation
import TweetNacl

public class databridges_nacl_wrapper {
    public var secret:String = ""
    
    public init(){
        self.secret = "";
    }
    
    func secureRandomBytes(count: Int) throws -> [UInt8]? {
        var bytes = [UInt8](repeating: 0, count: count)

        let status = SecRandomCopyBytes(
            kSecRandomDefault,
            count,
            &bytes
        )

        if status == errSecSuccess {
            return  bytes
        }else{
            return nil
        }
    }
    
 
    
    public func write(_ message:String) throws -> String{
        if self.secret.isEmpty { throw dbnwError("INVALID_SECRET" , "") }
        if message.isEmpty { throw dbnwError("INVALID_DATA" , "") }
        do{
            let key = Data(self.secret.utf8)
            guard let the_nonce = try? secureRandomBytes(count: 24) else { throw dbnwError("INVALID_DATA" , "invalid nonce")}
            
            let data =  Data(the_nonce)
            let msg = Data(message.utf8)
            
            let box = try NaclSecretBox.secretBox(message: msg, nonce: data , key: key)
            let boxEncoded = box.base64EncodedString()
            let strnone = Data(data).base64EncodedString()
            let retdata =  strnone + ":" + boxEncoded
            return retdata
        }catch (let error){
            throw dbnwError("NACL_EXCEPTION",  error.localizedDescription)
        }
    }
    
    public func read(_ message: String) throws -> String{
        if self.secret.isEmpty { throw dbnwError("INVALID_SECRET" , "") }
        if message.isEmpty { throw dbnwError("INVALID_DATA" , "") }
        if !message.contains(":")  { throw dbnwError("INVALID_DATA" , "") }
        do{
            let key = Data(self.secret.utf8)
            let splitmsg =  message.split(separator: ":")
            
            let decodedData = Data(base64Encoded: String(splitmsg[0]))
            let mdecodedData = Data(base64Encoded: String(splitmsg[1]))
            let openedBox = try NaclSecretBox.open(box: mdecodedData!, nonce: decodedData!, key: key)
            return String(decoding: openedBox, as: UTF8.self )
        }catch (let error){
            throw dbnwError("NACL_EXCEPTION",  error.localizedDescription)
        }
    }
    
}
