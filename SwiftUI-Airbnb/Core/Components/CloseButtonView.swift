//
//  CloseButtonView.swift
//  SwiftUI-Airbnb
//
//  Created by Umut Yenidil on 3.09.2024.
//

import SwiftUI

struct CloseButtonView: View {
    let onTap: () -> Void
    
    var body: some View {
        Button {
            onTap()
        } label: {
            Image(systemName: "xmark.circle")
                .imageScale(.large)
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    CloseButtonView {
        print("test")
    }
}
