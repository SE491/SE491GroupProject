import SwiftUI

struct NeighborhoodGuidesView: View {
    @StateObject private var viewModel = NeighborhoodGuidessViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView(.horizontal) {
                    HStack {
                        Button {
                            viewModel.selected(Neighborhood.southLoop)
                            viewModel.getData(category: "South Loop")
                        } label: {
                            Text("South Loop")
                                .foregroundStyle(.white)
                        }
                        .frame(width: 120, height: 40)
                        .background(Color.black)
                        .cornerRadius(8)
                        
                        Button {
                            viewModel.selected(Neighborhood.loganSquare)
                            viewModel.getData(category: "Logan Square")
                        } label: {
                            Text("Logan Square")
                                .foregroundStyle(.white)
                        }
                        .frame(width: 120, height: 40)
                        .background(Color.black)
                        .cornerRadius(8)
                        
                        Button {
                            
                        } label: {
                            Text("Lincoln Park")
                                .foregroundStyle(.white)
                        }
                        .frame(width: 120, height: 40)
                        .background(Color.black)
                        .cornerRadius(8)
                        
                        Button {
                            
                        } label: {
                            Text("Fulton Market")
                                .foregroundStyle(.white)
                        }
                        .frame(width: 120, height: 40)
                        .background(Color.black)
                        .cornerRadius(8)
                    }
                    .padding()
                }
                .scrollIndicators(.hidden)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Text(viewModel.title)
                            .font(.title2)
                            .fontWeight(.semibold)
                        Text(viewModel.description)
                        Text("Popular Restaurants")
                            .font(.title2)
                            .fontWeight(.semibold)
                        VStack {
                            ForEach(viewModel.restaurants) { restaurant in
                                ZStack(alignment: .leading) {
                                    NavigationLink {
                                        RestaurantDetailView(restaurant: restaurant)
                                    } label: {
                                        RestaurantCellView(restaurant: restaurant)
                                            .foregroundStyle(Color.black)
                                    }
                                }
                            }
                            .listRowSeparator(.hidden)
                        }
                        .listStyle(.plain)
                    }
                    .padding()
                    Spacer()
                }
            }
            .navigationTitle("Neighborhood Guides")
        }
        .onAppear {
            viewModel.selected(Neighborhood.southLoop)
            viewModel.getData(category: "South Loop")
        }
    }
}

#Preview {
    NeighborhoodGuidesView()
}
