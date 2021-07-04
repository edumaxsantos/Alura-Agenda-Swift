//
//  MapaViewController.swift
//  Agenda
//
//  Created by Eduardo Santos on 03/07/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit
import MapKit

class MapaViewController: UIViewController, CLLocationManagerDelegate {
    
    // MARK: - IBOutlets
    @IBOutlet weak var mapa: MKMapView!
    
    // MARK: - Variavel
    
    var aluno: Aluno?
    lazy var localizacao = Localizacao()
    lazy var gerenciadorDeLocalizacao = CLLocationManager()
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = getTitulo()
        verificaAutorizacaoDoUsuario()
        self.localizacaoInicial()
        self.localizarAluno()
        
        mapa.delegate = localizacao
        gerenciadorDeLocalizacao.delegate = self
    }
    
    // MARK: - Métodos
    
    func getTitulo() -> String {
        return "Localizar Alunos"
    }
    
    func verificaAutorizacaoDoUsuario() {
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
                case .authorizedWhenInUse:
                    let botao = Localizacao().configuraBotaoLocalizacaoAtual(mapa: mapa)
                    mapa.addSubview(botao)
                    gerenciadorDeLocalizacao.startUpdatingLocation()
                    break
                case .notDetermined:
                    gerenciadorDeLocalizacao.requestWhenInUseAuthorization()
                    break
                case .denied:
                    break
                default:
                    break
            }
        }
    }
    
    func localizacaoInicial() {
        print("localizacao inicial")
        Localizacao().converteEnderecoEmCoordenadas(endereco: "Caelum, São Paulo, SP") { localizacaoEncontrada in
            print("Localização foi encontrada")
            print(localizacaoEncontrada)
            let pino = Localizacao().configuraPino(titulo: "Caelum", localizacao: localizacaoEncontrada, cor: .black, icone: UIImage(named: "icon_caelum"))
            
            let regiao = MKCoordinateRegionMakeWithDistance(pino.coordinate, 5000, 5000)
            self.mapa.setRegion(regiao, animated: true)
            self.mapa.addAnnotation(pino)
        }
    }
    
    func localizarAluno() {
        if let aluno = aluno {
            Localizacao().converteEnderecoEmCoordenadas(endereco: aluno.endereco!) { localizacaoEncontrada in
                let pino = Localizacao().configuraPino(titulo: aluno.nome!, localizacao: localizacaoEncontrada)
                self.mapa.addAnnotation(pino)
            }
        }
    }
    
    // MARK: - CLLocationManagerDelegate
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
            case .authorizedWhenInUse:
                let botao = Localizacao().configuraBotaoLocalizacaoAtual(mapa: mapa)
                mapa.addSubview(botao)
                gerenciadorDeLocalizacao.startUpdatingLocation()
                break
            default:
                break
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
    }

    

}
