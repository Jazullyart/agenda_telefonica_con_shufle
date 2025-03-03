//
//  pantalla_agregar_contacto.swift
//  Agenda Shufle
//
//  Created by alumno on 3/3/25.
//

import SwiftUI

struct PantallaAgregarContacto: View {
    @State private var nombre: String = ""
    @State private var numero_telefonico: String = ""
    
    var body: some View {
        Text("Colocar la etiqueta de nombre")
        ZStack{
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 75)
                .foregroundColor(Color.teal)
            TextField("Placeholder", text: $nombre)
                .padding(10)
        }
        
        Text("Colocar el campo del número telefónico")
        TextField("Placeholder números", text: $numero_telefonico)
            .frame(height: 35)
            .padding(10)
        
        HStack{
            icono(tamaño: 65, ruta_icono: "person.crop.circle.badge.plus", padding: 10)
            Spacer()
            icono(tamaño: 65, ruta_icono: "return", padding: 10)
                .background(nombre == "" ? Color.clear:
                                Color.red)
        }
        .background(Color.cyan)
    }
}

#Preview {
    PantallaAgregarContacto()
}
