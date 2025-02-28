//
//  contacto_prevista.swift
//  Agenda Shufle
//
//  Created by alumno on 2/26/25.
//

import SwiftUI

struct ContactoPrevista: View {
    var contacto_a_mostrar: ContactoAgenda
    var al_pulsar: () -> Void = { print("No se ha implementado")}
    
    let equinas_redondeadas = CGSize(width: 55, height: 55)
    
    var body: some View {
        HStack(alignment: VerticalAlignment.center) {
            Spacer()
            
            VStack{
                Image("Image 1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 75, alignment: .center)
                    .clipShape(RoundedRectangle(cornerSize: equinas_redondeadas))
            }
            .background(Color.blue)
            
            Spacer()
            
            VStack(alignment: HorizontalAlignment.leading){
                Text(contacto_a_mostrar.nombre)
                Text(contacto_a_mostrar.telefono)
            }
            .background(Color.gray)
            .frame(width: 150)
            
            Spacer()
        }
        .frame(width: 250)
        .background(Color.pink)
        .onTapGesture {
            al_pulsar()
        }
    }
}

#Preview {
    ContactoPrevista(contacto_a_mostrar: ContactoAgenda(nombre: "Nombre", telefono: "Número telefónico"))
}
