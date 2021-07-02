//
//  ImagePicker.swift
//  Agenda
//
//  Created by Eduardo Santos on 02/07/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

enum MenuOpcoes {
    case camera
    case biblioteca
}

protocol ImagePickerFotoSelecionada {
    func imagePickerFotoSelecionada(_ foto: UIImage)
}

class ImagePicker: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: - Atributos
    var delegate: ImagePickerFotoSelecionada?
    
    // MARK: - Métodos
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let foto = info[UIImagePickerControllerOriginalImage] as! UIImage
        delegate?.imagePickerFotoSelecionada(foto)
        picker.dismiss(animated: true)
    }
    
    func menuDeOpcoes(completion: @escaping (_ opcao: MenuOpcoes) -> Void) -> UIAlertController {
        let menu = UIAlertController(title: "Atenção", message: "Escolha uma das opções abaixo", preferredStyle: .actionSheet)
        
        let camera = UIAlertAction(title: "Tirar foto", style: .default) { (acao) in
            completion(.camera)
        }
        
        let biblioteca = UIAlertAction(title: "Biblioteca", style: .default) { (acao) in
            completion(.biblioteca)
        }
        
        let cancelar = UIAlertAction(title: "Cancelar", style: .cancel)
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            menu.addAction(camera)
        }
        menu.addAction(biblioteca)
        menu.addAction(cancelar)
        
        
        return menu
    }

}
