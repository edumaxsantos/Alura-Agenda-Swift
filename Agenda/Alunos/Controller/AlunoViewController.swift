//
//  AlunoViewController.swift
//  Agenda
//
//  Created by Ândriu Coelho on 24/11/17.
//  Copyright © 2017 Alura. All rights reserved.
//

import UIKit

class AlunoViewController: UIViewController, ImagePickerFotoSelecionada {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var viewImagemAluno: UIView!
    @IBOutlet weak var imageAluno: UIImageView!
    @IBOutlet weak var buttonFoto: UIButton!
    @IBOutlet weak var scrollViewPrincipal: UIScrollView!
    
    @IBOutlet weak var textFieldNome: UITextField!
    @IBOutlet weak var textFieldEndereco: UITextField!
    @IBOutlet weak var textFieldTelefone: UITextField!
    @IBOutlet weak var textFieldSite: UITextField!
    @IBOutlet weak var textFieldNota: UITextField!
    
    // Mark: - Atributos
    let imagePicker = ImagePicker()
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.arredondaView()
        self.setup()
        NotificationCenter.default.addObserver(self, selector: #selector(aumentarScrollView(_:)), name: .UIKeyboardWillShow, object: nil)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - Métodos
    
    func arredondaView() {
        self.viewImagemAluno.layer.cornerRadius = self.viewImagemAluno.frame.width / 2
        self.viewImagemAluno.layer.borderWidth = 1
        self.viewImagemAluno.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @objc func aumentarScrollView(_ notification:Notification) {
        self.scrollViewPrincipal.contentSize = CGSize(width: self.scrollViewPrincipal.frame.width, height: self.scrollViewPrincipal.frame.height + self.scrollViewPrincipal.frame.height/2)
    }
    
    func setup() {
        imagePicker.delegate = self
    }
    
    // MARK: - Delegate
    func imagePickerFotoSelecionada(_ foto: UIImage) {
        imageAluno.image = foto
    }
    
    // MARK: - IBActions
    
    @IBAction func buttonFoto(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let multimidia = UIImagePickerController()
            multimidia.sourceType = .camera
            multimidia.delegate = imagePicker
            self.present(multimidia, animated: true)
        } else {
            let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
            let ac = UIAlertController(title: "Sem câmera", message: "Seu dispositivo não possui câmera", preferredStyle: .alert)
            ac.addAction(okButton)
            self.present(ac, animated: true)
        }
    }
    
    @IBAction func stepperNota(_ sender: UIStepper) {
        self.textFieldNota.text = "\(sender.value)"
    }
    
    
}
