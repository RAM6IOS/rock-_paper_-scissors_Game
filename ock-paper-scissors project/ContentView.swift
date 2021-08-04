//
//  ContentView.swift
//  ock-paper-scissors project
//
//  Created by MAC on 30/7/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var possiblemoves = ["Rock", "Paper", "Scissors"]
    @State private var Colorbr :[Color] = [.red, .green, .yellow]
    
    
    @State private var correctMoves = Int.random(in: 0...2)
    @State private var scoreTitle = ""
    @State private var showingScore = false
    @State private var scorePlyer  = 0
    @State private var scoreAi  = 0
    @State private var winreText  = ""



    let agents = ["Cyril", "Lana", "Pam", "Sterling"]
    @State private var showGreeting = true
    var body: some View {
        NavigationView{
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.white, .blue]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
      
        VStack {
            
          
        
            if scorePlyer >= 3 || scoreAi >= 3{
               
                VStack{
                    Spacer()
                if scoreAi == 3{
                   
                    Text("You loser try again")
                        .font(.system(size: 30, weight: .bold, design: .default))
                        .padding()
                    Spacer()
                    Button("Play agen") {
                                // flip the Boolean between true and false
                                self.PlayAgen()
                            }.padding()
                             .foregroundColor(Color.white)
                             .font(.system(size: 45, weight: .bold, design: .default))
                            .padding()
                             .background(Color.black)
                             .cornerRadius(25)
                    Spacer()
                }else{
                    Spacer()
                    Text("You winer")
                        .font(.system(size: 30, weight: .bold, design: .default))
                        .padding()
                    Spacer()
                    
                    Button("Play agen") {
                                // flip the Boolean between true and false
                                self.PlayAgen()
                            }
                           .padding()
                           .foregroundColor(Color.white)
                           .font(.system(size: 45, weight: .bold, design: .default))
                           .padding()
                           .background(Color.black)
                           .cornerRadius(25)
                    Spacer()
                        
                    
                }
                    Spacer()
                }
                
            }else{
            ForEach(0..<3){number in
                Button(action: {
                    self.flagTapped(number)
                }
                ){
                    VStack{
                    Text(self.possiblemoves[number])
                            .font(.system(size: 45, weight: .bold, design: .default))
                        
                        
                    }
                    .padding()
                    .foregroundColor(Color.white)
                     .background(Colorbr[number])
                     
                     .cornerRadius(10)
                     .padding()
                     .padding()
                   
                }
                    
                        
                
                
                
            }.alert(isPresented: $showingScore) {
                Alert(title: Text(scoreTitle), message: Text("AI choose: \(possiblemoves[correctMoves])"), dismissButton: .default(Text("Continue")) {
                    self.askQuestion()
                })
            }
            }
            Spacer()
            HStack( spacing: 20){
                VStack{
                Text("ScorePlyer:")
                    .font(.title)
                    Text("\(scorePlyer)")
                        .font(.title)
                }
                VStack{
                Text("ScoreAi")
                    .font(.title)
                    Text("\(scoreAi)")
                        .font(.title)
                }
                    
            }
            Spacer()
               }
        } .navigationBarTitle(Text("Rock-papr-Scissors").font(.system(size: 45, weight: .bold, design: .default)), displayMode: .inline)
            
        }
       
    }
    func flagTapped(_ number: Int) {
        if number == 0 && correctMoves == 2{
            scoreTitle = "yor win"
            scorePlyer+=1
           
        } else if number == 1 && correctMoves == 0 {
            scoreTitle = "yor win"
            scorePlyer+=1
            
        }
        else if number == 2 && correctMoves == 1 {
            scoreTitle = "yor win"
            scorePlyer+=1
           
        }
        else if number == correctMoves {
            scoreTitle = "Dewe"
        }
        
        else{
            scoreTitle = "loser"
            scoreAi+=1
            
        }
        
        
        
       
          showingScore = true
            
        
        
        
    }
    func askQuestion() {
        //possiblemoves.shuffle()
        correctMoves = Int.random(in: 0...2)

       
    }
    func PlayAgen(){
        scoreAi = 0
        scorePlyer = 0
        
    }
    }



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
