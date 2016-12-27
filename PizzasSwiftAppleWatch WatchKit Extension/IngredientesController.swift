//
//  IngredientesController.swift
//  PizzasSwiftAppleWatch
//
//  Created by Martin Juarez on 26/12/16.
//  Copyright © 2016 Martin Juarez Acheritobehere. All rights reserved.
//

import WatchKit
import Foundation


class IngredientesController: WKInterfaceController {
    
    var datosPedido : DatosPedido? = nil

    @IBOutlet var esSalchicha: WKInterfaceSwitch!
    @IBOutlet var esCebolla: WKInterfaceSwitch!
    @IBOutlet var esAceituna: WKInterfaceSwitch!
    @IBOutlet var esPimiento: WKInterfaceSwitch!
    @IBOutlet var esPinia: WKInterfaceSwitch!
    @IBOutlet var esAnchoa: WKInterfaceSwitch!
    @IBOutlet var esAtun: WKInterfaceSwitch!
    @IBOutlet var esJamon: WKInterfaceSwitch!
    @IBOutlet var esPavo: WKInterfaceSwitch!
    @IBOutlet var esPepperoni: WKInterfaceSwitch!
    
    
    var ingredientesSeleccionado : Bool = false
    var ingredientesSeleccionadoStr : String = ""
    var contadorIngredientes = 0

    @IBAction func changeSalchicha(_ value: Bool) {
        if (value == true){
            contadorIngredientes += 1
            ingredientesSeleccionadoStr += "salchicha - "
        } else {
            contadorIngredientes -= 1
            ingredientesSeleccionadoStr = ingredientesSeleccionadoStr.replacingOccurrences(of: "salchicha - ", with: "")
        }
    }
    
    @IBAction func changeCebolla(_ value: Bool) {
        if (value == true){
            contadorIngredientes += 1
            ingredientesSeleccionadoStr += "cebolla - "
        } else {
            contadorIngredientes -= 1
            ingredientesSeleccionadoStr = ingredientesSeleccionadoStr.replacingOccurrences(of: "cebolla - ", with: "")
        }
    }
    
    @IBAction func changeAceituna(_ value: Bool) {
        if (value == true){
            contadorIngredientes += 1
            ingredientesSeleccionadoStr += "aceituna - "
        } else {
            contadorIngredientes -= 1
            ingredientesSeleccionadoStr = ingredientesSeleccionadoStr.replacingOccurrences(of: "aceituna - ", with: "")
        }
    }
    
    @IBAction func changePimiento(_ value: Bool) {
        if (value == true){
            contadorIngredientes += 1
            ingredientesSeleccionadoStr += "pimiento - "
        } else {
            contadorIngredientes -= 1
            ingredientesSeleccionadoStr = ingredientesSeleccionadoStr.replacingOccurrences(of: "pimiento - ", with: "")
        }
    }
    
    @IBAction func changePinia(_ value: Bool) {
        if (value == true){
            contadorIngredientes += 1
            ingredientesSeleccionadoStr += "piña - "
        } else {
            contadorIngredientes -= 1
            ingredientesSeleccionadoStr = ingredientesSeleccionadoStr.replacingOccurrences(of: "piña - ", with: "")
        }
    }
    
    @IBAction func changeAnchoa(_ value: Bool) {
        if (value == true){
            contadorIngredientes += 1
            ingredientesSeleccionadoStr += "anchoa - "
        } else {
            contadorIngredientes -= 1
            ingredientesSeleccionadoStr = ingredientesSeleccionadoStr.replacingOccurrences(of: "anchoa - ", with: "")
        }
    }
    
    @IBAction func changeAtun(_ value: Bool) {
        if (value == true){
            contadorIngredientes += 1
            ingredientesSeleccionadoStr += "atun - "
        } else {
            contadorIngredientes -= 1
            ingredientesSeleccionadoStr = ingredientesSeleccionadoStr.replacingOccurrences(of: "atun - ", with: "")
        }
    }
    
    @IBAction func changeJamon(_ value: Bool) {
        if (value == true){
            contadorIngredientes += 1
            ingredientesSeleccionadoStr += "jamon - "
        } else {
            contadorIngredientes -= 1
            ingredientesSeleccionadoStr = ingredientesSeleccionadoStr.replacingOccurrences(of: "jamon - ", with: "")
        }
    }
    
    @IBAction func changePavo(_ value: Bool) {
        if (value == true){
            contadorIngredientes += 1
            ingredientesSeleccionadoStr += "pavo - "
        } else {
            contadorIngredientes -= 1
            ingredientesSeleccionadoStr = ingredientesSeleccionadoStr.replacingOccurrences(of: "pavo - ", with: "")
        }
    }
    
    @IBAction func changePepperoni(_ value: Bool) {
        if (value == true){
            contadorIngredientes += 1
            ingredientesSeleccionadoStr += "pepperoni - "
        } else {
            contadorIngredientes -= 1
            ingredientesSeleccionadoStr = ingredientesSeleccionadoStr.replacingOccurrences(of: "pepperoni - ", with: "")
        }
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        datosPedido = ((context as! NSDictionary)["data"] as? DatosPedido)!
    }

    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
        
        if (segueIdentifier == "ingredientesSegue"){
            
            if (contadorIngredientes == 0 || contadorIngredientes > 5){
                showPopup()
            }
            
            datosPedido = DatosPedido(t: (datosPedido?.tamanio)!, m: (datosPedido?.masa)!, q: (datosPedido?.queso)!, i: ingredientesSeleccionadoStr)
            
            pushController(withName: "ConfirmacionPedidoController", context: datosPedido)
            
            return ["segue":"ingredientesSegue", "data": datosPedido!]
            
        } else {
            return nil
        }
    }
    
    
    func showPopup(){
        let h0 = { print("ok")}
        
        var mensaje : String = "Máximo 5 ingredientes"
        if (contadorIngredientes == 0){
            mensaje = "Debe seleccionar al menos un ingrediente"
        }
        
        let action1 = WKAlertAction(title: "Aceptar", style: .default, handler:h0)
        presentAlert(withTitle: mensaje, message: "", preferredStyle: .actionSheet, actions: [action1])
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
