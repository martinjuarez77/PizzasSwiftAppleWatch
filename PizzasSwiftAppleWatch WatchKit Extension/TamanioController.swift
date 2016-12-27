//
//  InterfaceController.swift
//  PizzasSwiftAppleWatch WatchKit Extension
//
//  Created by Martin Juarez on 26/12/16.
//  Copyright © 2016 Martin Juarez Acheritobehere. All rights reserved.
//

import WatchKit
import Foundation


class TamanioController: WKInterfaceController {

    @IBOutlet var esTamanioGrande: WKInterfaceSwitch!
    @IBOutlet var esTamanioMediano: WKInterfaceSwitch!
    @IBOutlet var esTamanioChico: WKInterfaceSwitch!
    
    var datosPedido : DatosPedido? = nil
    
    var tamanioSeleccionado : Bool = false
    var tamanioSeleccionadoStr : String = ""
    
    @IBAction func changeTamanioGrande(value: Bool) {
        if (value == true){
            esTamanioMediano.setOn(false)
            esTamanioChico.setOn(false)
            tamanioSeleccionado = true
            tamanioSeleccionadoStr = "Grande"
        } else {
            tamanioSeleccionado = false
        }
    }
    
    @IBAction func changeTamanioMediano(value: Bool) {
        if (value == true){
            esTamanioGrande.setOn(false)
            esTamanioChico.setOn(false)
            tamanioSeleccionado = true
            tamanioSeleccionadoStr = "Mediano"
        } else {
            tamanioSeleccionado = false
        }
    }
    
    @IBAction func changeTamanioChico(value: Bool) {
        if (value == true){
            esTamanioGrande.setOn(false)
            esTamanioMediano.setOn(false)
            tamanioSeleccionado = true
            tamanioSeleccionadoStr = "Chico"
        } else {
            tamanioSeleccionado = false
        }
    }

    
    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
        
        if (segueIdentifier == "tamanioSegue"){

            if (tamanioSeleccionado == false){
                showPopup()
            }
            
            datosPedido = DatosPedido(t: tamanioSeleccionadoStr, m: "", q: "", i: "")

            pushController(withName: "MasaController", context: datosPedido)

            return ["segue":"tamanioSegue", "data": datosPedido!]

        } else {
            return nil
        }
    }
    
    
    func showPopup(){
        let h0 = { print("ok")}
        let action1 = WKAlertAction(title: "Aceptar", style: .default, handler:h0)
        presentAlert(withTitle: "Debe seleccionar un tamaño", message: "", preferredStyle: .actionSheet, actions: [action1])
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        //WKInterfaceController.reloadRootControllers(withNames: ["TamanioController"], contexts: [])
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
