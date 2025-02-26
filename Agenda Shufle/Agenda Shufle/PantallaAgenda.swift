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
    ContactoAgenda(nombre: "Aron", telefono: "656 123 4570")
]

struct PantallaAgenda: View {
    var body: some View {
        List{
            VStack {
                ForEach(contactos){ contacto in
                    Text("\(contacto.nombre)")
                    ContactoPrevista()
                }
            }
            .background(Color.teal)
        }
    }
}

#Preview {
    PantallaAgenda()
}
