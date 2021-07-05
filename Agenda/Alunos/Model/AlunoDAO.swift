//
//  AlunoDAO.swift
//  Agenda
//
//  Created by Eduardo Santos on 04/07/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit
import CoreData

class AlunoDAO: NSObject {
    
    var contexto: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }

    func salvaAluno(dicionarioDeAluno: Dictionary<String, Any>) {
        let aluno = Aluno(context: contexto)
        aluno.nome = dicionarioDeAluno["nome"] as? String
        aluno.endereco = dicionarioDeAluno["endereco"] as? String
        aluno.telefone = dicionarioDeAluno["telefone"] as? String
        aluno.site = dicionarioDeAluno["site"] as? String
        aluno.nota = (dicionarioDeAluno["nota"] as! NSString).doubleValue
        //aluno.foto = imageAluno.image
        atualizaContexto()
        
    }
    
    func atualizaContexto() {
        do {
            try contexto.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
