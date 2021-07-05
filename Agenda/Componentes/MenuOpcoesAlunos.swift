//
//  MenuOpcoesAlunos.swift
//  Agenda
//
//  Created by Eduardo Santos on 03/07/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

class MenuOpcoesAlunos: NSObject {
    
    func configuraMenuDeOpcoesDoAluno(navigation: UINavigationController, alunoSelecionado: Aluno) -> UIAlertController {
        let menu = UIAlertController(title: "Atenção", message: "escolha uma das opções abaixo", preferredStyle: .actionSheet)
        
        guard let viewController = navigation.viewControllers.last else { return menu }
        
        let sms = UIAlertAction(title: "enviar SMS", style: .default) { (acao) in
            Mensagem().enviaSMS(alunoSelecionado, controller: viewController)
        }
        
        menu.addAction(sms)
        
        let ligacao = UIAlertAction(title: "ligar", style: .default) { (acao) in
            LigacaoTelefonica().fazLigacao(alunoSelecionado)
        }
        
        menu.addAction(ligacao)
        
        let waze = UIAlertAction(title: "localizar no waze", style: .default) { (acao) in
            Localizacao().localizaAlunoNoWaze(alunoSelecionado)
        }
        
        menu.addAction(waze)
        
        let mapa = UIAlertAction(title: "localizar no mapa", style: .default) { acao in
            let mapa = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mapa") as! MapaViewController
            mapa.aluno = alunoSelecionado
            navigation.pushViewController(mapa, animated: true)
        }
        
        menu.addAction(mapa)
        
        let web = UIAlertAction(title: "abrir site", style: .default) { acao in
            Safari().abrePaginaWeb(alunoSelecionado, controller: viewController)
        }
        
        menu.addAction(web)
        
        let cancelar = UIAlertAction(title: "cancelar", style: .cancel, handler: nil)
        
        menu.addAction(cancelar)
        
        return menu
    }

}
