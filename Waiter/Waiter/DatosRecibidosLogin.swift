//
//  DatosRecibidosLogin.swift
//  Waiter
//
//  Created by Danny Boloban on 31/05/20.
//  Copyright © 2020 JackWolf. All rights reserved.
//

import Foundation

final class DatosRecibidosLogin:Codable{
    var id:Int?
    //Variables que se tienen en la api
    var username:String
    var jwt:String
    var email:String
    
    init(user:String, pass:String){
        self.username = user
        self.jwt = pass
    }
    
}
