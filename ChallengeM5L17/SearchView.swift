//
//  SearchView.swift
//  ChallengeM5L17
//
//  Created by Carlos Banza on 07/07/2021.
//

import SwiftUI

struct SearchView: View {
    //Declaration viriable
    @Binding var text:String
    
    @State private var isEditting = false
    
    var body: some View {
        HStack{
            ZStack{
                
                Rectangle()
                    .frame(height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .cornerRadius(10)
                    .foregroundColor(Color(.systemGray6))
                
                HStack{
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color(.systemGray))
                        .padding(.leading)
                    
                    TextField("Search", text: $text)
                        .padding([.top,.bottom],20)
                        .cornerRadius(10)
                        .onTapGesture {
                            self.isEditting = true
                        }
                    
                    if isEditting{
                        Button(action: {
                            self.isEditting = false
                            self.text = ""
                        }, label: {
                            Image(systemName: "multiply.circle")
                                .foregroundColor(Color(.systemGray))
                                .padding(.trailing)
                        })
                    }
                }
            }
            
            if isEditting{
                Button(action: {
                    self.isEditting = false
                    self.text = ""
                }, label: {
                    Text("Cancel")
                }).transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(text: .constant(""))
    }
}
