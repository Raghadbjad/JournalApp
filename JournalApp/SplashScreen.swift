//
//  SplashScreen.swift
//  JournalApp
//
//  Created by Raghad on 17/04/1446 AH.
//

import SwiftUI

struct SplashScreen: View {
    
    
    var body: some View{
        
        ZStack{
            
            Color(.black)
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack{
                
                
                Image("Book")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 77.7 , height: 101  )
                
                Text("Journali")
                    .foregroundColor(.white)
                    .font(.system(size: 42, weight: .black, design: .default))
                   
                    
                
                Text("Your thoughts, your story")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .light, design: .default))
                
            }
        }
        
        
    }
    
    
    
    
}


#Preview {
    SplashScreen()
}
