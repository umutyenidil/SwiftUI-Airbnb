//
//  DismissButtonView.swift
//  SwiftUI-Airbnb
//
//  Created by Umut Yenidil on 3.09.2024.
//

import SwiftUI

struct DismissButtonView: View {
    let onTap: () -> Void
    
    var body: some View {
        Button {
            onTap()
        } label: {
            Image(systemName: "chevron.left")
                .foregroundStyle(.black)
                .background {
                    Circle()
                        .fill(.white)
                        .frame(width: 32, height: 32)
                }
                .padding(32)
                .padding(.top, 32)
        }
    }
}

#Preview {
    DismissButtonView {
        print("test")
    }
}
