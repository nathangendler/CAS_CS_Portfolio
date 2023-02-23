//
//  SwiftUIView.swift
//  selfproject
//
//  Created by Nathan Gendler on 1/24/23.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        Button("Get the thing"){
            loadData()
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
