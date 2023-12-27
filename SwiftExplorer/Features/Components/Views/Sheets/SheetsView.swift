//
//  SwiftUIView.swift
//  SwiftExplorer
//
//  Created by Khondakar Afridi on 27/12/23.
//

import SwiftUI

struct SheetsView: View {
    @EnvironmentObject var navigationController : NavigationController
    var body: some View {
        VStack{
            List{
                Text("Base Sheet")
                    .onTapGesture {
                        navigationController.to(route: .baseSheet)
                    }
                Text("Full Screen Sheets")
                    .onTapGesture {
                        navigationController.to(route: .fullScreenSheet)
                    }
            }
            Button(action: {
                navigationController.popToRoot()
            }, label: {
                Text("Pop to Root")
            })
        }
        .navigationTitle(Text("Sheets"))
    }
}

#Preview {
    SheetsView()
}
