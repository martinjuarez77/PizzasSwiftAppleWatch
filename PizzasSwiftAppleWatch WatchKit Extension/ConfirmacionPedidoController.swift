//
//  ConfirmacionPedidoController.swift
//  PizzasSwiftAppleWatch
//
//  Created by Martin Juarez on 26/12/16.
//  Copyright © 2016 Martin Juarez Acheritobehere. All rights reserved.
//

import WatchKit
import Foundation


class ConfirmacionPedidoController: WKInterfaceController {

    var datosPedido : DatosPedido? = nil
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        datosPedido = ((context as! NSDictionary)["data"] as? DatosPedido)!
    }

    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
        
        if (segueIdentifier == "confirmarSegue"){
            datosPedido = DatosPedido(t: (datosPedido?.tamanio)!, m: (datosPedido?.masa)!, q: (datosPedido?.queso)!, i: (datosPedido?.ingredientes)!)
            
            pushController(withName: "FinPedidoController", context: datosPedido)
            
            return ["segue":"confirmarSegue", "data": datosPedido!]
            
        } else {
            return nil
        }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
