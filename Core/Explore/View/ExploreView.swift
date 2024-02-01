import SwiftUI

struct ExploreView: View {
        
    @State private var showDestinationSearchView = false
    @StateObject var viewModel = ExploreViewModel(service: ExploreService())
    
    var body: some View {
        NavigationStack{
            
            if showDestinationSearchView{
                DestinationSearchView(show: $showDestinationSearchView)
            }else{
                ScrollView{
                    SearchAndFilterBar()
                        .onTapGesture {
                            withAnimation(.snappy()){
                                showDestinationSearchView = true
                            }
                        }
                    LazyVStack(spacing: 30){
                        ForEach(viewModel.listings) {listing in
                            NavigationLink(value: listing) {
                                ListingItemView(listing: listing)
                                    .frame(height: 400)
                            }
                            
                            
                        }
                    }
                }.navigationDestination(for: Listing.self) { listing in
                    ListingDetailView(listing: listing)
                        .navigationBarBackButtonHidden()
                }
            }
                        
            
        }
    }
}

#Preview {
    ExploreView()
}
