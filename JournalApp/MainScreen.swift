//
//  MainScreen.swift
//  JournalApp
//
//  Created by Raghad on 17/04/1446 AH.
//

import SwiftUI

struct Journal: Identifiable {
    var id = UUID()  // Unique identifier for each Journal instance
    var title: String
    var date: String
    var description: String
}






struct MainScreen : View {
    @State var searchText = ""
    var body: some View{
        
            
            ZStack{
                
                
                
                Color(.black)
                    .ignoresSafeArea()
                    .scaledToFill()
                
                
                VStack{
                    
                    Text("Journali")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .heavy, design: .default))
                        .padding(.leading , -150)
                    
                   
//                    NavigationStack{
//                        Text("SEARCH FOR\(searchText)")
//                       }
//                    .searchable(text: $searchText)
                    
                    
                    HStack{
                        
                        
                        //filter and add button
                        
                    }
                    
                    //search bar
                    
                    
                    
                    
                    
                    
                    
                    // journal cards
                    
                    
                    Spacer()
                }
                
            }
            
            
        }
        
    static func getCurrentDate() -> String {
           let formatter = DateFormatter()
           formatter.dateStyle = .medium // Example: Oct 21, 2023
           return formatter.string(from: Date())
       }
        
        
    }


#Preview {
    MainScreen()
}
