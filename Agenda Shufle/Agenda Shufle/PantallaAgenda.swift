//
//  PantallaAgenda.swift
//  Agenda Shufle
//
//  Created by alumno on 2/26/25.
//

import SwiftUI

let contactos = [
    ContactoAgenda(nombre: "Juan", telefono: "656 123 4567"),
    ContactoAgenda(nombre: "Pablo", telefono: "656 123 4568"),
    ContactoAgenda(nombre: "Astrid", telefono: "656 123 4569"),
    ContactoAgenda(nombre: "Aron", telefono: "656 123 4570"),
    ContactoAgenda(nombre: "Juan", telefono: "656 123 4567"),
    ContactoAgenda(nombre: "Pablo", telefono: "656 123 4568"),
    ContactoAgenda(nombre: "Astrid", telefono: "656 123 4569"),
    ContactoAgenda(nombre: "Aron", telefono: "656 123 4570"),
    ContactoAgenda(nombre: "Juan", telefono: "656 123 4567"),
    ContactoAgenda(nombre: "Pablo", telefono: "656 123 4568"),
    ContactoAgenda(nombre: "Astrid", telefono: "656 123 4569"),
    ContactoAgenda(nombre: "Aron", telefono: "656 123 4570")
]

struct PantallaAgenda: View {
    var ancho_de_pantalla = UIScreen.main.bounds.width
    var largo_de_pantalla = UIScreen.main.bounds.height
    
    var body: some View {
        ScrollView{
            VStack(spacing: 10) {
                ForEach(contactos){ contacto in
                    //Text("\(contacto.nombre)")
                    ContactoPrevista(contacto_a_mostrar: contacto, al_pulsar: {print("Te envia saludos \(contacto.nombre) desde la página agenda")})
                }
            }
            .background(Color.teal)
            .frame(width: ancho_de_pantalla, alignment: Alignment.center)
        }
        .background(Color.mint)
    }
}

#Preview {
    PantallaAgenda()
}
