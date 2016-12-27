//
//  FinPedidoController.swift
//  PizzasSwiftAppleWatch
//
//  Created by Martin Juarez on 26/12/16.
//  Copyright © 2016 Martin Juarez Acheritobehere. All rights reserved.
//

import WatchKit
import Foundation


class FinPedidoController: WKInterfaceController {

    @IBOutlet var detallesPedido: WKInterfaceLabel!
    var datosPedido : DatosPedido? = nil
    var textoPedido : String = ""
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        datosPedido = ((context as! NSDictionary)["data"] as? DatosPedido)!
        textoPedido += "Masa: " + (datosPedido?.masa ?? "") + "\r\n"
        textoPedido += "Queso: " + (datosPedido?.queso ?? "") + "\r\n"
        textoPedido += "Tamaño: " + (datosPedido?.tamanio ?? "") + "\r\n"
        textoPedido += "Ingredientes: " + (datosPedido?.ingredientes ?? "")
        
        detallesPedido.setText(textoPedido)
        
    }

    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func backPressed() {
        print("back button pressed")
    }
}
