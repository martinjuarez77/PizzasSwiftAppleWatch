//
//  DatosPedido.swift
//  PizzasSwiftAppleWatch
//
//  Created by Martin Juarez on 26/12/16.
//  Copyright © 2016 Martin Juarez Acheritobehere. All rights reserved.
//

import WatchKit

class DatosPedido: NSObject {
    var tamanio : String
    var masa : String
    var queso : String
    var ingredientes : String
    
    init(t : String, m : String, q : String, i : String){
        tamanio = t
        masa = m
        queso = q
        ingredientes = i
        
    }

}
