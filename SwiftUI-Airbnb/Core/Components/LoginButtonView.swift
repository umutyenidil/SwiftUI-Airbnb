//
//  LoginButtonView.swift
//  SwiftUI-Airbnb
//
//  Created by Umut Yenidil on 3.09.2024.
//

import SwiftUI

struct LoginButtonView: View {
    let onTap: () -> Void
    var body: some View {
        Button {
            onTap()
        } label: {
            Text("Log in")
                .foregroundStyle(.white)
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding()
                .frame(width: 360, height: 48)
                .background(.pink)
                .clipShape(RoundedRectangle(cornerRadius: 12.0))
        }
    }
}

#Preview {
    LoginButtonView {
        print("test")
    }
}
