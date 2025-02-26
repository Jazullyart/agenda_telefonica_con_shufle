//
//  PantallaAgenda.swift
//  Agenda Shufle
//
//  Created by alumno on 2/26/25.
//

import SwiftUI

struct PantallaAgenda: View {
    var body: some View {
        List{
            VStack {
                ForEach(0...150, id: \.self){ _ in
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
