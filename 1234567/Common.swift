//
//  Common.swift
//  yCheng
//
//  Created by De Peng Li on 2017/3/20.
//  Copyright © 2017年 De Peng Li. All rights reserved.
//

import Foundation
import UIKit

var isRemeber = false


let url_boot = "http://api.azhongzhi.com/api"


let T_Version = "1.0.0"
let T_device_type = "ios"

// 数据表常量表名

let T_SQLITE_IMAGE = "IMAGEINFOTABLE"
let T_SQLITE_PRODUCT = "PRODUCTINFOTABLE"
let T_SQLITE_SHOP_PRODUCTS = "SHOPPRODUCTSINFOTABLE"
let T_SQLITE_EX_SHOP_PRODUCTS = "EXCHANGESHOPPRODUCTSINFOTABLE"
let T_SQLITE_SHOP_IMAGELIST = "SHOPIMAGELISTINFOTABLE"
let T_SQLITE_CREDIT_LIST = "CREDITLISTINFOTABLE"
let T_SQLITE_ADDRESS_LIST = "ADDRESSLISTINFOTABLE"
let T_SQLITE_Ticket_LIST = "TICKETLISTINFOTABLE"
let T_SQLITE_PRODCUT_LIST = "PRODUCTLISTINFOTABLE"

// 常量变量名
let T_Device_Token = "Device_Token"
let Key_Lanuch_Time = "Key_Lanuch_Time"





let mainColor = UIColor(red: 1/255, green: 12/255, blue: 68/255, alpha: 1.0)
let borderColor = UIColor(red: 233/255, green: 233/255, blue: 233/255, alpha: 1.0)
let grayColor = UIColor(red: 171/255, green: 171/255, blue: 171/255, alpha: 1.0)
let simpleFont = UIFont(name: "Arial", size: 12.0)

let litColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)

let workingQueue = DispatchQueue(label: "my_queue", attributes: [])

func getFileDicrectry() -> String {
    return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
}

func saveImageFile(imageName name:String, imageData image:UIImage, Type type:String) -> Void {
    if type.lowercased() == "png" {
        do {
            try UIImagePNGRepresentation(image)?.write(to: URL(fileURLWithPath: getFileDicrectry() + "/\(name).\(type.lowercased())"), options: .atomicWrite)
        }catch{
            
        }
        
    }else{
        do {
            try UIImageJPEGRepresentation(image, 1.0)?.write(to: URL(fileURLWithPath: getFileDicrectry() + "/\(name).\(type.lowercased())"), options: .atomicWrite)
        }catch{
            
        }
        
    }
}
func loadImage(imageName name:String , ofType type:String) -> AnyObject {
    let filePath = getFileDicrectry() + "/\(name).\(type.lowercased())"
    let fileManager = FileManager.default
    if (fileManager.fileExists(atPath: filePath)){
        return UIImage(contentsOfFile: getFileDicrectry() + "/\(name).\(type.lowercased())")!
    }else{
        return UIImage()
    }
    
}


func JSONStringify(_ value: AnyObject,prettyPrinted:Bool = false) -> String{
    
    let options = prettyPrinted ? JSONSerialization.WritingOptions.prettyPrinted : JSONSerialization.WritingOptions(rawValue: 0)
    
    
    if JSONSerialization.isValidJSONObject(value) {
        do{
            let data = try JSONSerialization.data(withJSONObject: value, options: options)
            //            NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8Encoding];
            
            return String(data: data, encoding: String.Encoding.utf8)!
        }catch let error as NSError{
            print("\(error)")
            //Access error here
        }
        
    }
    return ""
}

func StringToJSON(_ data:Data) -> Dictionary<String,AnyObject> {
    
    //    let data = value.dataUsingEncoding(NSUTF8StringEncoding)
    do{
        let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
        
        return (json as? Dictionary<String,AnyObject>)!
    }
    catch let error as NSError{
        print("\(error)")
    }
    return Dictionary()
}

func isExistPath(_ namefile:String) -> (Bool,String) {
    let documentsDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
    let imageSubdirectory = documentsDirectory[0] + ("/"+namefile)
    if !FileManager().fileExists(atPath: imageSubdirectory){
        FileManager().createFile(atPath: imageSubdirectory, contents: nil, attributes: nil)
    }else{
        return (true,imageSubdirectory)
    }
    return (false,imageSubdirectory)
}



func random(_ min:UInt32,max:UInt32)->UInt32{
    return  arc4random_uniform(max-min)+min
}
func randomString(_ len:Int)->String{
    let min:UInt32=97,max:UInt32=122
    var string=""
    for _ in 0..<len{
        string.append(String(describing: UnicodeScalar(random(min,max:max))))
    }
    return string
    
}
extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }
}

func validateMobile(phoneNum:String)-> Bool {
    
    // 手机号以 13 14 15 18 开头   八个 \d 数字字符
    
    let phoneRegex = "^((13[0-9])|(17[0-9])|(14[^4,\\D])|(15[^4,\\D])|(18[0-9]))\\d{8}$|^1(7[0-9])\\d{8}$";
    
    let phoneTest = NSPredicate(format: "SELF MATCHES %@" , phoneRegex)
    
    return (phoneTest.evaluate(with: phoneNum));
    
}


extension Int
{
    func hexedString() -> String
    {
        return NSString(format:"%02x", self) as String
    }
}

extension NSData
{
    func hexedString() -> String
    {
        var string = String()
        let unsafePointer = bytes.assumingMemoryBound(to: UInt8.self)
        for i in UnsafeBufferPointer<UInt8>(start:unsafePointer, count: length)
        {
            string += Int(i).hexedString()
        }
        return string
    }
    func MD5() -> NSData
    {
        let result = NSMutableData(length: Int(CC_MD5_DIGEST_LENGTH))!
        let unsafePointer = result.mutableBytes.assumingMemoryBound(to: UInt8.self)
        CC_MD5(bytes, CC_LONG(length), UnsafeMutablePointer<UInt8>(unsafePointer))
        return NSData(data: result as Data)
    }
}

extension String
{
    func MD5() -> String
    {
        let data = (self as NSString).data(using: String.Encoding.utf8.rawValue)! as NSData
        return data.MD5().hexedString()
    }
}
