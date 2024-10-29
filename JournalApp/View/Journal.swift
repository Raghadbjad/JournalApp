//
//  Journal.swift
//  JournalApp
//
//  Created by Raghad on 20/04/1446 AH.
//


import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let r, g, b: Double
        r = Double((int >> 16) & 0xFF) / 255.0
        g = Double((int >> 8) & 0xFF) / 255.0
        b = Double(int & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}


struct ContentView: View {
    
    @StateObject var JournalViewModel1 = JournalViewModel()
    
    var body: some View {
        
        NavigationStack {
            if self.JournalViewModel1.isActive {
                ZStack {
                    Color.black
                        .scaledToFill()
                        .ignoresSafeArea()
                    
                    VStack {
                        Image("Book")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 77.7, height: 101) // تغيير المقاسات هنا
                        
                        Text("Journali")
                            .foregroundColor(.white)
                            .font(.system(size: 42, weight: .black, design: .default))
                        
                        Text("Your thoughts, your story")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .light, design: .default))
                    }
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            withAnimation {
                                self.JournalViewModel1.isActive = false
                            }
                        }
                    }
                }
            } else {
                if !(JournalViewModel1.journals.isEmpty) {
                    ZStack {
                        Color.black
                            .ignoresSafeArea()
                        
                        VStack (spacing : 10) {
                            HStack {
                                Button(action: {
                                    JournalViewModel1.isShowingAddJournal.toggle()
                                }) {
                                    Label {
                                        Text("") // استخدام نص فارغ
                                    } icon: {
                                        Image(systemName: "plus.circle.fill")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 30, height: 30) // تغيير المقاسات هنا
                                            .foregroundStyle(
                                                           Color(hex: "#D4CBFF"),       // لون الهيكل الخارجي
                                                           Color.gray.opacity(0.4)     // لون التعبئة الداخلي
                                                       )
                                    }
                                }
                                .padding(.leading, 200)
                                
                                Menu {
                                    Button("Bookmark") {
                                        JournalViewModel1.sortOption = .bookmark
                                    }
                                    Button("Journal Date") {
                                        JournalViewModel1.sortOption = .date
                                    }
                                } label: {
                                    Label {
                                        Text("") // استخدام نص فارغ
                                    } icon: {
                                        Image(systemName: "line.horizontal.3.decrease.circle.fill")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 30, height: 30) // تغيير المقاسات هنا
                                            .foregroundStyle(
                                                           Color(hex: "#D4CBFF"),       // لون الهيكل الخارجي
                                                           Color.gray.opacity(0.4)     // لون التعبئة الداخلي
                                                       )
                                    }
                                }
                                .padding(.leading, 1)
                            }
                            TextField("Search ...", text: $JournalViewModel1.searchText)
                                .padding(10)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(8)
                                .padding(.horizontal)
                                .foregroundColor(.white)
                            List {
                                ForEach(JournalViewModel1.filteredJournals) { journal in
                                    VStack(alignment: .leading, spacing: 1) {
                                        HStack {
                                            Text(journal.title)
                                                .bold()
                                                .lineLimit(1)
                                                .truncationMode(.tail)
                                                .foregroundColor(Color(hex: "#D4CBFF"))
                                            Spacer()
                                            
                                            Button(action: {
                                                JournalViewModel1.toggleBookmark(journal: journal)
                                            }) {
                                                Image(systemName: journal.isBookmarked ? "bookmark.fill" : "bookmark")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 30, height: 30) // تغيير المقاسات هنا
                                                    .foregroundStyle(
                                                               Color(hex: "#D4CBFF"),       // External color
                                                               Color.gray.opacity(0.4)     // Internal fill color
                                                           )
                                            }
                                        }
                                        
                                        Text("\(journal.date)")
                                            .foregroundColor(.gray)
                                        Spacer()
                                        Text("\(journal.description)")
                                            .foregroundColor(.white)
                                            .padding(.bottom, 50)
                                    }
                                    .padding()
                                    .frame(width: 350, height: 227)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(14)
                                    .listRowBackground(Color.black)
                                    .swipeActions(edge: .leading) {
                                        Button(action: {
                                            JournalViewModel1.editJournal(journal: journal)
                                            JournalViewModel1.isShowingAddJournal = true // Show edit screen
                                        }) {
                                            Label {
                                                Text("") // استخدام نص فارغ
                                            } icon: {
                                                Image(systemName: "pencil")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 30, height: 30)
                                            }
                                        }
                                        .tint(Color("Color4"))
                                    }
                                    
                                    .swipeActions(edge: .trailing) {
                                        Button(role: .destructive, action: {
                                            JournalViewModel1.deleteJournal(journal: journal)
                                        }) {
                                            Label {
                                                Text("")
                                            } icon: {
                                                Image(systemName: "trash")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 30, height: 30) // تغيير المقاسات هنا
                                            }
                                        }
                                        .tint(.red)
                                    }
                                }
                            }
                            .listStyle(PlainListStyle()) // Remove default white separators
                        }
                    }
                    
                } else {
                    ZStack {
                        Color(.black)
                            .scaledToFill()
                            .ignoresSafeArea()
                        
                        VStack(spacing: 15) {
                            HStack {
                                Button(action: {
                                                               // Add filter action here if needed
                                                           }) {
                                                               Label {
                                                                   Text("") // استخدام نص فارغ
                                                               } icon: {
                                                                   Image(systemName: "line.horizontal.3.decrease.circle.fill")
                                                                       .resizable()
                                                                       .scaledToFit()
                                                                       .frame(width: 30, height: 30) // تغيير المقاسات هنا
                                                                       .foregroundStyle(
                                                                                      Color(hex: "#D4CBFF"),       // لون الهيكل الخارجي
                                                                                      Color.gray.opacity(0.4)     // لون التعبئة الداخلي
                                                                                  )
                                                               }
                                                           }
                                .padding(.leading, 200)
                                Button(action: {
                                    JournalViewModel1.isShowingAddJournal.toggle()
                                }) {
                                    Label {
                                        Text("") // استخدام نص فارغ
                                    } icon: {
                                        Image(systemName: "plus.circle.fill")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 30, height: 30) // تغيير المقاسات هنا
                                            .foregroundStyle(
                                                           Color(hex: "#D4CBFF"),       // لون الهيكل الخارجي
                                                           Color.gray.opacity(0.4)     // لون التعبئة الداخلي
                                                       )
                                    }
                                }
                                .padding(.leading, 1)
                            }
                            
                            Text("Journali")
                                .foregroundColor(.white)
                                .font(.system(size: 30, weight: .heavy))
                                .padding(.leading, -150)
                            
                            Spacer()
                            
                            Image("Book")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 77.7, height: 101) // تغيير المقاسات هنا
                            
                            Text("Begin Your Journal")
                                .foregroundColor(.accent)
                                .font(.system(size: 24, weight: .heavy))
                            
                            Text("Craft your personal diary, tap the \n             plus icon to begin")
                                .font(.system(size: 18, weight: .light))
                                .foregroundColor(.white)
                        }
                        .padding(.bottom, 300)
                    }
                }
            }
        }
        .sheet(isPresented: $JournalViewModel1.isShowingAddJournal) {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack {
                    // Top buttons
                    HStack {
                        Button(action: {
                            JournalViewModel1.isShowingAddJournal = false // Close sheet
                        }) {
                            Text("Cancel")
                                .foregroundColor(.color4)
                                .padding(.trailing, 120)
                                .padding(.top, 10)
                        }
                        
                        Button(action: {
                            if JournalViewModel1.isEditing {
                                JournalViewModel1.saveEditedJournal() // Save edits
                            } else {
                                JournalViewModel1.addJournal() // Call the new addJournal method
                            }
                        }) {
                            Text("Save")
                                .foregroundColor(.color4)
                                .padding(.leading, 120)
                                .padding(.top, 10)
                        }
                    }
                    
                    VStack(alignment:.leading) {
                        TextField("Title", text: $JournalViewModel1.newJournalTitle)
                            .font(.title)
                            .textFieldStyle(PlainTextFieldStyle())
                            .background(Color.clear)
                            .foregroundColor(.white)
                        
                        Text(JournalViewModel1.currentDate)
                            .foregroundColor(.gray)
                        
                        TextField("Type your Journal...", text: $JournalViewModel1.newJournalDescription)
                            .font(.footnote)
                            .textFieldStyle(PlainTextFieldStyle())
                            .background(Color.clear)
                            .foregroundColor(.white)
                        
                        Spacer()
                    }
                    .padding(.leading , 10)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}


