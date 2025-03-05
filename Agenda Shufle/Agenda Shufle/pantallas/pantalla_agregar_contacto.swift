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
    
    var boton_salir: ( ) -> Void = {
        print("Parece que te has equivocado")
    }
    var boton_agregar: (_ nombre: String, _ numero: String) -> Void = {nombre, numero in
        print("Parece que te has equivocado")
    }
    
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
            //Icono para agregar contacto
            icono(tamaño: 65, ruta_icono: "person.crop.circle.badge.plus", padding: 10)
                .onTapGesture {
                    boton_agregar(nombre, numero_telefonico)
                }
            Spacer()
            //Icono para regres
            icono(tamaño: 65, ruta_icono: "return", padding: 10)
                .background(nombre == "" ? Color.clear:
                                Color.red)
                .onTapGesture {
                    boton_salir()
                }
        }
        .background(Color.cyan)
    }
}

#Preview {
    PantallaAgregarContacto()
}
