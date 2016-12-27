//
//  MasaController.swift
//  PizzasSwiftAppleWatch
//
//  Created by Martin Juarez on 26/12/16.
//  Copyright © 2016 Martin Juarez Acheritobehere. All rights reserved.
//

import WatchKit
import Foundation


class MasaController: WKInterfaceController {

    @IBOutlet var esMasaDelgada: WKInterfaceSwitch!
    @IBOutlet var esMasaCrujiente: WKInterfaceSwitch!
    @IBOutlet var esMasaGruesa: WKInterfaceSwitch!
    
    var datosPedido : DatosPedido? = nil
    
    var masaSeleccionado : Bool = false
    var masaSeleccionadoStr : String = ""
    
    @IBAction func changeMasaDelgada(value: Bool) {
        if (value == true){
            esMasaCrujiente.setOn(false)
            esMasaGruesa.setOn(false)
            masaSeleccionado = true
            masaSeleccionadoStr = "Delgada"
        } else {
            masaSeleccionado = false
        }
    }
    
    @IBAction func changeMasaCrujiente(value: Bool) {
        if (value == true){
            esMasaDelgada.setOn(false)
            esMasaGruesa.setOn(false)
            masaSeleccionado = true
            masaSeleccionadoStr = "Crujiente"
        } else {
            masaSeleccionado = false
        }
    }
    
    @IBAction func changeMasaGruesa(value: Bool) {
        if (value == true){
            esMasaDelgada.setOn(false)
            esMasaCrujiente.setOn(false)
            masaSeleccionado = true
            masaSeleccionadoStr = "Gruesa"
        } else {
            masaSeleccionado = false
        }
    }
    
    func showPopup(){
        let h0 = { print("ok")}
        let action1 = WKAlertAction(title: "Aceptar", style: .default, handler:h0)
        presentAlert(withTitle: "Debe seleccionar un tipo de masa", message: "", preferredStyle: .actionSheet, actions: [action1])
    }
    
    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
        
        if (segueIdentifier == "masaSegue"){
            if (masaSeleccionado == false){
                showPopup()
            }
            
            datosPedido = DatosPedido(t: (datosPedido?.tamanio)!, m: masaSeleccionadoStr, q: "", i: "")
            
            pushController(withName: "QuesoController", context: datosPedido)
            
            return ["segue":"masaSegue", "data": datosPedido!]
            
        } else {
            return nil
        }
    }

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        datosPedido = ((context as! NSDictionary)["data"] as? DatosPedido)!
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
