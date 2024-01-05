//
//  MeasurementFormatterView.swift
//  SwiftExplorer
//
//  Created by Khondakar Afridi on 1/5/24.
//

import SwiftUI

struct MeasurementFormatterView: View {
    let distanceInKilometers: Double = 1.2
    let formatter = MeasurementFormatter()
    var body: some View {
        let measurement = Measurement(value: distanceInKilometers, unit: UnitLength.kilometers)
        VStack{
            Text("MeasurementFormatter View in Action")
            Text("Distance is \(formatter.string(from: measurement))")
        }
        .onAppear {
            formatter.locale = Locale(identifier: "en_US")
        }
    }
}

#Preview {
    MeasurementFormatterView()
}
