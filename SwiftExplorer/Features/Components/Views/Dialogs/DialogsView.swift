//
//  DialogsView.swift
//  SwiftExplorer
//
//  Created by Khondakar Afridi on 27/12/23.
//

import SwiftUI

struct DialogsView: View {
    @EnvironmentObject var navigationController : NavigationController
    var body: some View {
        VStack{
            List{
                Text("Action Sheet")
                    .onTapGesture {
                        navigationController.to(route: .customActionSheet)
                    }
                Text("Action Dialog")
                    .onTapGesture {
                        navigationController.to(route: .customAlertDialog)
                    }
            }
            Button(action: {
                navigationController.popToRoot()
            }, label: {
                Text("Pop to Root")
            })
        }
        .navigationTitle(Text("Dialogs View"))
    }
}

#Preview {
    DialogsView()
}
