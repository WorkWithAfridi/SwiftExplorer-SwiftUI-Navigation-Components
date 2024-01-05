//
//  ModifierList.swift
//  SwiftExplorer
//
//  Created by Khondakar Afridi on 1/5/24.
//

import SwiftUI

struct ModifierListView: View {
    @EnvironmentObject private var navigationController: NavigationController
    var body: some View {
        List {
            Text("MeasurementFormatter")
                .onTapGesture {
                    navigationController.to(route: .measurementFormatter)
                }
        }
    }
}

#Preview {
    ModifierListView()
}
