//
//  pantalla_del_ganador.swift
//  Agenda Shufle
//
//  Created by alumno on 3/5/25.
//

import SwiftUI

var contacto_alterno = ContactoAgenda(nombre: "Chavito", telefono: "656 888 8888")

struct pantalla_del_ganador: View {
    var contacto_a_molestar: ContactoAgenda
    
    var body: some View {
        ZStack{
            Circle().foregroundColor(Color.teal)
                .frame(width: 250)
            icono(tamaño: 150, ruta_icono: "person.fill", padding: 10)
                .foregroundColor(.white)
        }
        Text(contacto_a_molestar.nombre)
        Text(contacto_a_molestar.telefono)
    }
}

#Preview {
    pantalla_del_ganador(contacto_a_molestar: contacto_alterno)
}
