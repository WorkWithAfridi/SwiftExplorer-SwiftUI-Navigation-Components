//
//  PickerView.swift
//  SwiftExplorer
//
//  Created by Khondakar Afridi on 28/12/23.
//

import SwiftUI

struct PickerView: View {
    @EnvironmentObject var navigationController : NavigationController
    var body: some View {
        VStack{
            List{
                Text("PhotoPicker")
                    .onTapGesture {
                        navigationController.to(route: .photoPicker)
                    }
            }
            Button(action: {
                navigationController.popToRoot()
            }, label: {
                Text("Pop to Root")
            })
        }
        .navigationTitle(Text("Picker View"))
    }
}

#Preview {
    PickerView()
}
