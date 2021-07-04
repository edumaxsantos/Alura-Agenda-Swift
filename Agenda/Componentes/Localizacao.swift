//
//  Localizacao.swift
//  Agenda
//
//  Created by Eduardo Santos on 03/07/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit
import MapKit

class Localizacao: NSObject, MKMapViewDelegate {
    
    func converteEnderecoEmCoordenadas(endereco: String, local: @escaping (_ local: CLPlacemark) -> Void) {
        let conversor = CLGeocoder()
        conversor.geocodeAddressString(endereco) { listaDeLocalizacoes, error in
            if let error = error {
                print("Endereço: \(endereco) não encontrado. Erro: \(error.localizedDescription)")
            }
            if let localizacao = listaDeLocalizacoes?.first {
                local(localizacao)
            }
        }
    }
    
    func configuraPino(titulo: String, localizacao: CLPlacemark, cor: UIColor? = nil, icone: UIImage? = nil) -> Pino {
        let pino = Pino(coordenada: localizacao.location!.coordinate)
        pino.title = titulo
        pino.color = cor
        pino.icon = icone
        
        return pino
    }
    
    func configuraBotaoLocalizacaoAtual(mapa: MKMapView) -> MKUserTrackingButton {
        let botao = MKUserTrackingButton(mapView: mapa)
        
        botao.frame.origin.x = 10
        botao.frame.origin.y = 10
        
        return botao
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is Pino {
            let annotationView = annotation as! Pino
            var pinoView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationView.title!) as? MKMarkerAnnotationView
            
            pinoView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: annotationView.title!)
            
            pinoView?.annotation = annotationView
            pinoView?.glyphImage = annotationView.icon
            pinoView?.markerTintColor = annotationView.color
            
            return pinoView
        }
        
        return nil
    }
}
