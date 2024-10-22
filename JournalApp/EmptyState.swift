//
//  EmptyState.swift
//  JournalApp
//
//  Created by Raghad on 19/04/1446 AH.
//
import SwiftUI

struct EmptyState : View {
    
    
    
    var body: some View {
        
        ZStack{
            
            Color(.black)
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack (spacing: 15){
                
                HStack{
                
                    Button(action : {
                        print("add")
                    } ){
                        
                        Image(systemName:"plus.circle.fill")
                            .foregroundStyle(.color1 , .gray.opacity(0.4))
                        
                    }
                        
                    .padding(.leading , 200)
                    Button(action: {
                        print("fillter")
                        
                    }) {
                        
                        Image(systemName: "line.horizontal.3.decrease.circle.fill")
                            .foregroundStyle(.color1 , .gray.opacity(0.4))
                        
                    }
                    .padding(.leading , 1)
                   
                }
                
                Text("Journali")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .heavy, design: .default))
                    .padding(.leading , -150)
                
                Spacer()
                   
                
                
               
               
                Image("Book")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 77 , height: 101  )
                  
                Text("Begin Your Journal")
                    .foregroundColor(.color1)
                    .font(.system(size: 24, weight: .heavy, design: .default))
                   
                   
                Text("Craft your personal diary, tap the \n             plus icone to begin")
                    .font(.system(size: 18, weight: .light, design: .none))
                    .foregroundColor(.white)
                
                   
                 
                
            }
            .padding(.bottom , 300)
            
        }
        
     
        
    }
    
    
}

#Preview {
    EmptyState()
}

