import SwiftUI

//manage selected option
enum DestinationSearchOption {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    
    @Binding var show: Bool
    @State private var destination = ""
    @State private var selectedOption: DestinationSearchOption = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var guestNumber: Int = 0

    
    var body: some View {
        
        VStack{
            //X mark button
            HStack {
                Button{
                    withAnimation(.bouncy){
                        show.toggle()
                    }
                } label: {
                    Image(systemName: "xmark")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }
                
                Spacer()
                
                //Clear button
                
                if !destination.isEmpty{
                    Button("Clear"){
                        destination = ""
                    }.foregroundStyle(.black)
                       
                }
                
            }.padding()
            
            //MARK: -Location view
            VStack(alignment: .leading){
                if selectedOption == .location{
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        
                        
                        TextField("Search destinations", text: $destination)
                            .font(.subheadline)
                        
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(Color(.systemGray4))
                        
                    }
                    
                }else{
                    CollapsedPickerView(title: "Where", descrbtion: "Add destination")
                    
                }
                
                
                
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height:selectedOption == .location ? 120 : 64)
            
            .onTapGesture {
                withAnimation(.snappy){
                    selectedOption = .location}
            }
            
            
            //MARK: -Date selection view + //adding tap gesture to expland
            VStack(alignment: .leading){
                //Expanded View
                if selectedOption == .dates{
                        
                            Text("When's your trip?")
                                .font(.title2)
                                .fontWeight(.semibold)
                    VStack{
                        
                        DatePicker("From", selection: $startDate,  displayedComponents: .date)
                        Divider()
                        DatePicker("To", selection: $endDate,  displayedComponents: .date)
                        
                    
                    }   .foregroundStyle(.gray)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                 
                        
                        
                    
                }
                else{
                    //Collapsed View
                    CollapsedPickerView(title: "When", descrbtion: "Add dates")
                    
                }
            }
                .modifier(CollapsibleDestinationViewModifier())
                .frame(height:selectedOption == .dates ? 180 : 64)
            
                
                .onTapGesture {
                    withAnimation(.snappy){selectedOption = .dates}
                }
            
            
            //MARK: -Num guests view
            VStack(alignment: .leading){
                //Expanded View
                if selectedOption == .guests{
                    
                                       
                    Text("Who's coming?")
                        .font(.title2)
                        .fontWeight(.semibold)
                        
                    
                    Stepper{
                        Text ("\(guestNumber) adults")
                    } onIncrement: {
                       
                        guestNumber = guestNumber + 1
                        
                    } onDecrement: {
                        guard guestNumber > 0 else {return}
                        guestNumber = guestNumber - 1
                      
                }
                
                }else{
                    //Collapsed View
                    CollapsedPickerView(title: "Who", descrbtion: "Add guestis")
                    
                }
            }   .modifier(CollapsibleDestinationViewModifier())
                .frame(height:selectedOption == .guests ? 120 : 64)
                .onTapGesture {
                    withAnimation(.snappy){selectedOption = .guests}
                }
        
        
        
        Spacer()
        
        }
        
    }
}

#Preview {
    DestinationSearchView(show: .constant(false))
}

//MARK: - CollapsibleDestinationViewModifier

struct CollapsibleDestinationViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        
                content
                    .padding()
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding()
                    .shadow(radius: 10)
        

    }
    
}

//MARK: - Extracted view for when/who (location/guests)
struct CollapsedPickerView: View {
    let title: String
    let descrbtion: String
    
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .foregroundStyle(.gray)
                
                
                Spacer()
                
                
                Text(descrbtion)
                    .foregroundStyle(.black)
                
            }
            .fontWeight(.semibold)
            .font(.subheadline)
            
        }
        
    }
}
