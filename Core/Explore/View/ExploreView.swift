import SwiftUI

struct ExploreView: View {
        
    @State private var showDestinationSearchView = false
    
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
                        ForEach(0 ... 10, id: \.self) {listing in
                            NavigationLink(value: listing) {
                                ListingItemView()
                                    .frame(height: 400)
                            }
                            
                            
                        }
                    }
                }.navigationDestination(for: Int.self) { listing in
                    ListingDetailView()
                        .navigationBarBackButtonHidden()
                }
            }
                        
            
        }
    }
}

#Preview {
    ExploreView()
}
