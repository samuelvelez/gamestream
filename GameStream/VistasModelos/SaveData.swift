//
//  SaveData.swift
//  GameStream
//
//  Created by Samuel on 5/4/22.
//

import Foundation

class SaveData{
    
    var correo: String = ""
    var contrasena: String = ""
    var nombre: String = ""
    
    
    func guardarDatos(correo: String, contrasena: String, nombre: String)-> Bool{
        
        print("llego \(correo) \(contrasena) \(nombre)")
        
        UserDefaults.standard.set([correo, contrasena, nombre], forKey: "datosUsuario")
        
        return true
    }
    
    func recuperarDatos() -> [String]{
        let datosUsuario: [String] = UserDefaults.standard.stringArray(forKey: "datosUsuario") ?? [""]
        print("recuperar \(datosUsuario)")
        return datosUsuario
    }
    
    func validar(correo: String, contrasena: String) -> Bool{
        
        var correoGuardado = ""
        var contrasenaGuardada = ""
        
        print("verificando la info")
        
        if UserDefaults.standard.object(forKey: "datosUsuario") != nil{
            correoGuardado = UserDefaults.standard.stringArray(forKey: "datosUsuario")![0]
            contrasenaGuardada = UserDefaults.standard.stringArray(forKey: "datosUsuario")![1]
            
            print("tengo guardado \(correoGuardado) y \(contrasenaGuardada)")
            if(correo == correoGuardado && contrasena == contrasenaGuardada){
                return true
            }
        }else{
            print("no hay datos")
            return false
        }
        
        return false
        
    }
    
}
