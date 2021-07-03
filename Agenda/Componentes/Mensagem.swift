//
//  Mensagem.swift
//  Agenda
//
//  Created by Eduardo Santos on 03/07/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit
import MessageUI

class Mensagem: NSObject, MFMessageComposeViewControllerDelegate {
    
    // MARK: - Métodos
    func configuraSMS(_ aluno: Aluno) -> MFMessageComposeViewController? {
        
        if MFMessageComposeViewController.canSendText() {
            let componenteMensagem = MFMessageComposeViewController()
            guard let numeroDoAluno = aluno.telefone else { return componenteMensagem }
            componenteMensagem.recipients = [numeroDoAluno]
            componenteMensagem.messageComposeDelegate = self
            
            return componenteMensagem
        } else {
            return nil
        }
    }
    
    // MARK: - MessageComposeDelegate
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true)
    }
    

}
