//
//  AlunoAPI.swift
//  Agenda
//
//  Created by Eduardo Santos on 04/07/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit
import Alamofire

class AlunoAPI: NSObject {
    
    // MARK: - GET
    func recuperaAlunos(completion: @escaping () -> Void) {
        AF.request("http://localhost:8080/api/aluno", method: .get).responseJSON { response in
            switch response.result {
                case let .success(result):
                    if let resposta = result as? Dictionary<String, Any> {
                        guard let listaDeAlunos = resposta["alunos"] as? Array<Dictionary<String, Any>> else { return }
                        for dicionarioDeAluno in listaDeAlunos {
                            AlunoDAO().salvaAluno(dicionarioDeAluno: dicionarioDeAluno)
                        }
                        completion()
                    }
                    break
                case let .failure(error):
                    print(error.localizedDescription)
                    completion()
                    break
            }
        }
    }
    
    // MARK: - PUT
    func salvaAlunosNoServidor(parametros: Array<Dictionary<String, String>>) {
        guard let url = URL(string: "http://localhost:8080/api/aluno/lista") else { return }
        var requisicao = URLRequest(url: url)
        requisicao.httpMethod = "PUT"
        let json = try! JSONSerialization.data(withJSONObject: parametros)
        requisicao.httpBody = json
        requisicao.addValue("application/json", forHTTPHeaderField: "Content-Type")
        AF.request(requisicao).resume()
    }

}
