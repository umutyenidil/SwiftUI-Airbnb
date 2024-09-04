//
//  DestinationSearchView.swift
//  SwiftUI-Airbnb
//
//  Created by Umut Yenidil on 3.09.2024.
//

import SwiftUI

enum DestinationSearchOptions {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    @Binding var visible: Bool
    @State private var selectedOption: DestinationSearchOptions = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var guestCount = 0
    @ObservedObject var viewModel: ExploreViewModel
    
    
    var body: some View {
        VStack {
            HStack {
                CloseButtonView {
                    viewModel.updateListingForLocation()
                    withAnimation(.snappy) {
                        visible.toggle()
                    }
                }
                
                Spacer()
                
                if !viewModel.searchLocation.isEmpty {
                    Button {
                        viewModel.searchLocation = ""
                        viewModel.updateListingForLocation()
                    } label: {
                        Text("Clear")
                            .foregroundStyle(.black)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                }
            }
            .padding()
            
            VStack(alignment: .leading) {
                if selectedOption == .location {
                    Text("Where to ?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        
                        TextField("Search Destinations", text: $viewModel.searchLocation)
                            .font(.subheadline)
                            .onSubmit {
                                viewModel.updateListingForLocation()
                                visible.toggle()
                            }
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8.0)
                            .stroke(lineWidth: 1.0)
                            .foregroundStyle(Color(.systemGray4))
                    }
                } else {
                    CollapsedPickerView(title: "When", description: "Add Destination")
                }
            }
            .modifier(CollapsibleDestinationViewModifier(height: selectedOption == .location ? 120 : 64))
            .onTapGesture {
                withAnimation(.snappy) { selectedOption = .location }
            }
            
            VStack(alignment: .leading) {
                if selectedOption == .dates {
                    Text("When's your trip ?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack {
                        DatePicker("From", selection: $startDate, displayedComponents: .date)
                        
                        Divider()
                        
                        DatePicker("To", selection: $endDate, displayedComponents: .date)
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                } else {
                    CollapsedPickerView(title: "When", description: "Add Dates")
                }
            }
            .modifier(CollapsibleDestinationViewModifier(height: selectedOption == .dates ? 180 : 64))
            .onTapGesture {
                withAnimation(.snappy) { selectedOption = .dates }
            }
            
            VStack(alignment: .leading) {
                if selectedOption == .guests {
                    Text("Who's coming ?")
                        .font(.title2)
                        .fontWeight(.semibold)
                      
                    Stepper {
                        Text("\(guestCount) Adults")
                    } onIncrement: {
                        guestCount += 1
                    } onDecrement: {
                        guard guestCount > 0 else { return }
                        guestCount -= 1
                    }
                } else {
                    CollapsedPickerView(title: "Who", description: "Add Guests")
                }
            }
            .modifier(CollapsibleDestinationViewModifier(height: selectedOption == .guests ? 120 : 64))
            .onTapGesture {
                withAnimation(.snappy) { selectedOption = .guests }
            }
            
            Spacer()
        }
    }
}

#Preview {
    DestinationSearchView(visible: .constant(true), viewModel: ExploreViewModel(service: ExploreService()))
}

struct CollapsibleDestinationViewModifier: ViewModifier {
    let height: Double
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(height: height)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 2)
    }
}

struct CollapsedPickerView: View {
    let title: String
    let description: String
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(description)
                
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
    }
}
