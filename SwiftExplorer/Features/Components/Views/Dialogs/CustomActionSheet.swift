//
//  ActionDialog.swift
//  SwiftExplorer
//
//  Created by Khondakar Afridi on 27/12/23.
//

import SwiftUI

struct CustomActionSheet: View {
    @State private var isActionSheetPresented = false

    var body: some View {
        VStack {
            Button("Show Action Sheet") {
                self.isActionSheetPresented.toggle()
            }
            .padding()
        }
        .actionSheet(isPresented: $isActionSheetPresented) {
            ActionSheet(
                title: Text("Options"),
                message: Text("Choose an action"),
                buttons: [
                    .default(Text("Action 1")) {
                        // Handle action 1
                        print("Action 1 selected")
                    },
                    .default(Text("Action 2")) {
                        // Handle action 2
                        print("Action 2 selected")
                    },
                    .cancel()
                ]
            )
        }
    }
}

#Preview {
    CustomActionSheet()
}
