//
//  MapaViewController.swift
//  Agenda
//
//  Created by Eduardo Santos on 03/07/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

class MapaViewController: UIViewController {
    
    // MARK: - Variavel
    
    var aluno: Aluno?
    
    // MARK: - Métodos

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = getTitulo()
    }
    
    func getTitulo() -> String {
        return "Localizar Alunos"
    }


}
