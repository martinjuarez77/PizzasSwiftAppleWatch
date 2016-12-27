//
//  QuesoController.swift
//  PizzasSwiftAppleWatch
//
//  Created by Martin Juarez on 26/12/16.
//  Copyright © 2016 Martin Juarez Acheritobehere. All rights reserved.
//

import WatchKit
import Foundation


class QuesoController: WKInterfaceController {

    
    @IBOutlet var esQuesoMozzarella: WKInterfaceSwitch!
    @IBOutlet var esQuesoCheddar: WKInterfaceSwitch!
    @IBOutlet var esQuesoParmesano: WKInterfaceSwitch!
    @IBOutlet var esSinQueso: WKInterfaceSwitch!
    
    var datosPedido : DatosPedido? = nil
    
    var quesoSeleccionado : Bool = false
    var quesoSeleccionadoStr : String = ""

    func showPopup(){
        let h0 = { print("ok")}
        let action1 = WKAlertAction(title: "Aceptar", style: .default, handler:h0)
        presentAlert(withTitle: "Debe seleccionar un tipo de queso", message: "", preferredStyle: .actionSheet, actions: [action1])
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        datosPedido = ((context as! NSDictionary)["data"] as? DatosPedido)!
    }

    @IBAction func changeConMozzarella(_ value: Bool) {
        if (value == true){
            esQuesoCheddar.setOn(false)
            esQuesoParmesano.setOn(false)
            esSinQueso.setOn(false)
            quesoSeleccionado = true
            quesoSeleccionadoStr = "Mozzarella"
        } else {
            quesoSeleccionado = false
        }
    }
    
    @IBAction func changeConCheddar(_ value: Bool) {
        if (value == true){
            esQuesoMozzarella.setOn(false)
            esQuesoParmesano.setOn(false)
            esSinQueso.setOn(false)
            quesoSeleccionado = true
            quesoSeleccionadoStr = "Cheddar"
        } else {
            quesoSeleccionado = false
        }

    }
    
    @IBAction func changeConParmesano(_ value: Bool) {
        if (value == true){
            esQuesoCheddar.setOn(false)
            esQuesoMozzarella.setOn(false)
            esSinQueso.setOn(false)
            quesoSeleccionado = true
            quesoSeleccionadoStr = "Parmesano"
        } else {
            quesoSeleccionado = false
        }

    }
    
    @IBAction func changeSinQueso(_ value: Bool) {
        if (value == true){
            esQuesoCheddar.setOn(false)
            esQuesoParmesano.setOn(false)
            esQuesoMozzarella.setOn(false)
            quesoSeleccionado = true
            quesoSeleccionadoStr = "Sin queso"
        } else {
            quesoSeleccionado = false
        }

    }
    
    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
        
        if (segueIdentifier == "quesoSegue"){
            if (quesoSeleccionado == false){
                showPopup()
            }
            
            datosPedido = DatosPedido(t: (datosPedido?.tamanio)!, m: (datosPedido?.masa)!, q: quesoSeleccionadoStr, i: "")
            
            pushController(withName: "IngredientesController", context: datosPedido)
            
            return ["segue":"quesoSegue", "data": datosPedido!]
            
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
