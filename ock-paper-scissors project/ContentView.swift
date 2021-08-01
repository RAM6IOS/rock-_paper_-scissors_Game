//
//  ContentView.swift
//  ock-paper-scissors project
//
//  Created by MAC on 30/7/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var possiblemoves = ["Rock", "Paper", "Scissors"]
    @State private var correctMoves = Int.random(in: 0...2)
    @State private var scoreTitle = ""
    @State private var showingScore = false
    @State private var scorePlyer  = 0
    @State private var scoreAi  = 0
    @State private var winreText  = ""



    let agents = ["Cyril", "Lana", "Pam", "Sterling"]
    @State private var showGreeting = true
    var body: some View {
        
        VStack {
            Text(possiblemoves[correctMoves])
          
            
            if scorePlyer >= 3 || scoreAi >= 3{
               
                VStack{
                if scoreAi == 3{
                    Text("You loser try again")
                        .font(.title3)
                        .padding()
                    Button("Play agen") {
                                // flip the Boolean between true and false
                                self.PlayAgen()
                            }.padding()
                             .foregroundColor(Color.white)
                            .padding()
                             .background(Color.black)
                             .cornerRadius(25)
                }else{
                    
                    Text("You winer")
                        .font(.title3)
                        .padding()
                    Button("Play agen") {
                                // flip the Boolean between true and false
                                self.PlayAgen()
                            }
                           .padding()
                           .foregroundColor(Color.white)
                           .padding()
                           .background(Color.black)
                           .cornerRadius(25)
                        
                    
                }
                
                }
                
            }else{
            ForEach(0..<3){number in
                Button(action: {
                    self.flagTapped(number)
                }
                ){
                    VStack{
                    Text(self.possiblemoves[number])
                        .font(.title3)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.black)
                        .frame(width: 130, height: 130)
                        .clipShape(Capsule())
                        
                    }
                }
                    
                        
                
                
                
            }.alert(isPresented: $showingScore) {
                Alert(title: Text(scoreTitle), message: Text("Your score is ???"), dismissButton: .default(Text("Continue")) {
                    self.askQuestion()
                })
            }
            }
            
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
