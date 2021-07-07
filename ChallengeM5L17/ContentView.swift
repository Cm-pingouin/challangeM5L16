    //
    //  ContentView.swift
    //  ChallengeM5L17
    //
    //  Created by Carlos Banza on 07/07/2021.
    //
    
    import SwiftUI
    
    struct ContentView: View {
        
        @EnvironmentObject var lesson:ContentModule
        @State var search = ""
        
        var body: some View {
            
            VStack(alignment: .leading){
                //Title
                HStack{
                    Text("All Video")
                        .bold()
                        .font(.largeTitle)
                        .padding()
                }
                
                //SearchView
                SearchView(text: $search)
                    .padding(.bottom,20)
                    .padding(.horizontal)
                
                List(lesson.modules.filter({search.isEmpty ? true : $0.title!.contains(search)})){ module in
                    
                    NavigationLink(
                        destination: MediaView()
                            .onAppear(perform: {
                                lesson.getLessonById(module.id!)
                            }),
                        label: {
                            Text(module.title!)
                        })
                }
                
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .environmentObject(ContentModule())
        }
    }
