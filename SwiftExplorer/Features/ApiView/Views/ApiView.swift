//
//  ApiView.swift
//  SwiftExplorer
//
//  Created by Khondakar Afridi on 27/12/23.
//

import SwiftUI

struct ApiView: View {
    @EnvironmentObject var navigationController : NavigationController
    var body: some View {
        VStack{
            List{
                Text("Get Coin")
                    .onTapGesture {
                        navigationController.to(route: .coinList)
                    }
            }
            Button(action: {
                navigationController.popToRoot()
            }, label: {
                Text("Pop to Root")
            })
        }
        .navigationTitle(Text("Api View"))
    }
}

#Preview {
    ApiView()
}
