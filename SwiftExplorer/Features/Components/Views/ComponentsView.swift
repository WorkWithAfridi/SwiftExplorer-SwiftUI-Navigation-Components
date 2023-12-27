//
//  ComponentsView.swift
//  SwiftExplorer
//
//  Created by Khondakar Afridi on 27/12/23.
//

import SwiftUI

struct ComponentsView: View {
    @EnvironmentObject var navigationController : NavigationController
    var body: some View {
        VStack{
            List{
                Text("Pop Over")
                    .onTapGesture {
                        navigationController.to(route: .popover)
                    }
                Text("Pop up Menu")
                    .onTapGesture {
                        navigationController.to(route: .popUpMenu)
                    }

            }
            Button(action: {
                navigationController.popToRoot()
            }, label: {
                Text("Pop to Root")
            })
        }
        .navigationTitle(Text("Components View"))
    }
}

#Preview {
    ComponentsView()
}
