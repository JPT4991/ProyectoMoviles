//
//  DatosLogin.swift
//  Waiter
//
//  Created by Danny Boloban on 30/05/20.
//  Copyright © 2020 JackWolf. All rights reserved.
//

import Foundation

final class DatosLogin:Codable{
    var id:Int?
    //Variables que se tienen en la api
    var identifier:String
    var password:String
    
    init(user:String, pass:String){
        self.identifier = user
        self.password = pass
    }
    
}
