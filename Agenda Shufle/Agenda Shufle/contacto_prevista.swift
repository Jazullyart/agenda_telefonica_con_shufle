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
        HStack(alignment: VerticalAlignment.center, spacing: 10) {
            Spacer()
            
            VStack{
                Image("Image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(7)
                    .frame(height: 75, alignment: .center)
                    .clipShape(RoundedRectangle(cornerSize: equinas_redondeadas))
            }
            
            Spacer()
            
            VStack(alignment: HorizontalAlignment.leading, spacing: 10){
                Text(contacto_a_mostrar.nombre)
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text(contacto_a_mostrar.telefono)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerSize:equinas_redondeadas))
        .overlay(
            RoundedRectangle(cornerRadius: 55)
                .stroke(LinearGradient(colors: [Color.blue, Color.teal, Color.blue], startPoint: .leading, endPoint: .trailing))
        )
    }
}

#Preview {
    ContactoPrevista(contacto_a_mostrar: ContactoAgenda(nombre: "Nombre", telefono: "Número telefónico"))
}
