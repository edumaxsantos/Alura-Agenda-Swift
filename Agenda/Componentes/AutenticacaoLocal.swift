//
//  AutenticacaoLocal.swift
//  Agenda
//
//  Created by Eduardo Santos on 04/07/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit
import LocalAuthentication

class AutenticacaoLocal: NSObject {
    
    var error: NSError?

    func autorizaUsuario(completion: @escaping (_ autenticado: Bool) -> Void) {
        let contexto = LAContext()
        
        if contexto.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            contexto.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "autenticação necessária para apagar aluno") { resposta, erro in
                completion(resposta)
            }
        } else {
            print(error?.localizedDescription)
        }
    }
}
