//
//  ContentView.swift
//  RockFish
//
//  Created by Emilio Castro on 7/4/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    @State var dark = false
    @State var show = false
    
    var body : some View {
        
        NavigationView{
        ZStack(alignment: .leading) {
            GeometryReader{_ in
                
                VStack{
                    ZStack(alignment: .center){
                        
                       
                        Text("Rock Fish")
                                                   .font(.title)
                            
                        
                        HStack(spacing: 10){
                            
                            Button(action: {
                                withAnimation(.default){
                                    self.show.toggle()
                                }
                                
                            }) {
                                Image(systemName: "command").renderingMode(.original)
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                
                            }
                            
                            Spacer()
                            
                            
                            Button(action: {
                                withAnimation(.default){
                                    self.show.toggle()
                                }
                                
                            }) {
                                Image(systemName: "magnifyingglass.circle").renderingMode(.original)
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                
                            }
                            
                            
                            Button(action: {
                                                        withAnimation(.default){
                                                            self.show.toggle()
                                                        }
                                                        
                                                    }) {
                                                        Image(systemName: "suit.heart.fill").renderingMode(.original)
                                                            .resizable()
                                                            .frame(width: 25, height: 25)
                                                        
                                                    }
                            Button(action: {
                                withAnimation(.default){
                                    self.show.toggle()
                                }
                                
                            }) {
                                Image(systemName: "cart").renderingMode(.original)
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                
                            }
                            
                        }
                        
                        
                        
                        
                      
                        
                    }.padding()
                        .foregroundColor(.primary)
                        .overlay(Rectangle().stroke(Color.primary.opacity(0.1),  lineWidth: 1).shadow(radius: 3).edgesIgnoringSafeArea(.top))
                    
                   
                    
                    
                    MainView()
                   
                    
                }.background(Color.white)
                    .padding([.leading,.trailing,.top],5)
                
                
            }
            
            HStack{
            
            Menu(dark: self.$dark, show: self.$show)
                .preferredColorScheme(self.dark ? .dark : .light
            )
                .offset(x: self.show ? 0 : -UIScreen.main.bounds.width / 1.5)
        
                Spacer(minLength: 0)
            }
            .background(Color.primary.opacity(self.show ? (self.dark ? 0.05 : 0.2) : 0).edgesIgnoringSafeArea(.all))
            
            }.navigationBarBackButtonHidden(true)
            .navigationBarTitle("")
            .navigationBarHidden(true)
    }
    }
}

struct Menu : View {
    
    @Binding var dark : Bool
    @Binding var show : Bool
    var body : some View  {
        VStack{
            HStack{
                
                Button(action: {
                    
                    withAnimation(.easeInOut){
                        self.show.toggle()
                    }
                }) {
                    Image("back")
                    .resizable()
                        .frame(width: 12, height: 20)
                }
                Spacer()
                
                
                Button(action: {
                    
                }){
                    Image(systemName: "square.and.pencil")
                        .font(.title)
                }
            }
            .padding(.top)
            .padding(.bottom,25)
            
            Image("user")
            .resizable()
                .frame(width: 80, height: 80)
            .clipShape(Circle())
            
            VStack(spacing: 12){
                Text("Emilio")
                
                Text("Owner")
                    .font(.caption)
            }
            .padding(.top,25)
            
            HStack(spacing: 15){
                Image(systemName: "moon.fill")
                    .font(.title)
                      
                Text("Modo Oscuro")
                Spacer()
                
                Button(action: {
                    
                    self.dark.toggle()
                    
                    UIApplication.shared.windows.first?.rootViewController?
                        .view.overrideUserInterfaceStyle = self.dark ? .dark : .light
                    
                }){
                    
                    Image("off")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .font(.title)
                        .rotationEffect(.init(degrees: self.dark ? 180 : 0))
                }
            }
            .padding(.top,25)
            
            Group{
                
                Button(action: {
                     
                 }){
                     HStack(spacing: 22){
                         
                         Image(systemName: "person.crop.circle.fill")
                         .resizable()
                             .frame(width: 25, height: 25)
                             .foregroundColor(.yellow)
                         
                         Text("Mi Perfil")
                          Spacer()
                     }
                     
                     
                 }
                 .padding(.top,25)
                
                Button(action: {
                     
                 }){
                     HStack(spacing: 22){
                         
                         Image(systemName: "person.crop.circle.fill")
                         .resizable()
                             .frame(width: 25, height: 25)
                             .foregroundColor(.yellow)
                         
                         Text("Accesorios")
                         Spacer()
                     }
                     
                     
                 }
                 .padding(.top,25)
                
                Divider()
                    .padding(.top, 25)
                Button(action: {
                    
                }){
                    HStack(spacing: 22){
                        
                        Image(systemName: "person.crop.circle.fill")
                        .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.yellow)
                        
                        Text("Productos")
                         Spacer()
                    }
                    
                    
                }
                .padding(.top,25)
            }
            
            Spacer()
            
        }
        .foregroundColor(.primary)
            .padding(.horizontal,20)
        .frame(width: UIScreen.main.bounds.width / 1.5)
        .background((self.dark ? Color.black  : Color.white).edgesIgnoringSafeArea(.all))
        .overlay(Rectangle().stroke(Color.primary.opacity(0.2),  lineWidth: 2).shadow(radius: 3).edgesIgnoringSafeArea(.all))
    }
}

struct MainView : View {
    @State var selected = "Redcap"
    var body : some View {
        
       
            VStack(spacing: 15){
                       HStack{
                           HStack{
                               Button(action: {
                                   
                                   
                               }) {
                                   HStack{
                                       Text("Orandas")
                                       Spacer()
                                       Image(systemName: "arrow.down")
                                   }.padding()
                               }.foregroundColor(.black)
                                   .background(Color.white)
                               
                               Button(action: {
                                   
                               }) {
                                   Image(systemName: "line.horizontal.3.decrease.circle").renderingMode(.original).padding()
                                   
                                   
                               }.background(Color.white)
                           }
                       }
                HStack{
                    ForEach(types, id: \.self){ i in
                        HStack{
                            Button(action: {
                                self.selected = i
                            }){
                                Text(i).padding()
                            }
                            .foregroundColor(self.selected == i ? .white : .black)
                            .background(self.selected == i ? Color.black : Color.clear)
                            .cornerRadius(10)
                            
                            Spacer(minLength: 0)
                        }
                        
                    }
                }
                
                       DetailScroll()
                       }.padding()
                .background(Color(.clear))
                .animation(.spring())
            
               
        
    }
}

struct DetailScroll : View {
    @State var show = false
    
    var body : some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 12){
                
            
            ForEach(datas){i in
                HStack{
                    ForEach(i.rows){j in
                        
                        Cards(row: j)
                    }
                    
                }
                
            }
        }
        }
    }
}

struct Cards : View {
    var row : row
    @State var show = false
  
    var body : some View {
        VStack(spacing: 8){
                            
            NavigationLink(destination: DetailView(show: $show, name: row.name, image: row.image, price: row.price, desc: row.desc ), isActive: $show){
                                
                                Image(row.image).renderingMode(.original).resizable().frame(width: UIScreen.main.bounds.width / 2-25, height: 240)
                                
                            }
                           
                            
                            HStack{
                                VStack(alignment: .leading, spacing: 10){
                                    
                                    Text(row.name)
                                    Text(row.price).fontWeight(.heavy)
                                }
                                Spacer()
                                
                                Button(action: {
                                    
                                }){
                                    Image(systemName: "line.horizontal.3").renderingMode(.original)
                                }.padding(.trailing,15)
                            }
                        }
    }
}

struct DetailView : View{
    @Binding var show : Bool
    @State var name : String
    @State var image : String
    @State var price : String
    @State var desc : String
    
      @State var size = ""
    var body : some View{
        
        VStack(spacing: 0){
            HStack(spacing: 18){
                
                Button(action: {
                    self.show.toggle()
                }){
                    Image("back").renderingMode(.original)
                    .resizable()
                    .frame(width: 25, height: 25)
                    
                }
                Spacer()
                Button(action: {
                                   
                               }){
                                   Image(systemName: "magnifyingglass.circle").renderingMode(.original)
                               }
                
               
                Button(action: {
                                   
                               }){
                                   Image(systemName: "cart").renderingMode(.original)
                               }
            }.navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                .padding([.bottom,.leading, .trailing], 15)
            
       
            Image(image).resizable()
            
            VStack(alignment: .leading, spacing: 15){
                
                HStack{
                    VStack(alignment: .leading, spacing: 8){
                                     Text(name).font(.largeTitle)
                                                   Text(price).fontWeight(.heavy)
                                 }
                    Spacer()
                    HStack(spacing: 10){
                        Circle().fill(Color.green).frame(width: 20, height: 20)
                         Circle().fill(Color.red).frame(width: 20, height: 20)
                         Circle().fill(Color.blue).frame(width: 20, height: 20)
                        
                    }
                               
                }
             
                
                Text(desc)
                
                Text("Seleccione Tamaño")
                
                HStack{
                    ForEach(sizes, id: \.self){i in
                                  
                                   Button(action: {
                                       self.size = i
                                   }){
                                       
                                       Text(i).padding().border(Color.black, width: self.size == i ? 1.5 : 0)
                                   }.foregroundColor(.black)
                               }
                    
                }
                HStack{
                    Button(action: {
                        
                    }){
                        Text("Agregar al Carro").padding().border(Color.black, width: 1.4)
                    }.foregroundColor(.black)
                    Spacer()
                    Button(action: {
                                   
                               }){
                                   Text("Comprar Ahora").padding()
                               }
                    .foregroundColor(.white)
                    .background(Color.black)
                .cornerRadius(10)
                    
                }.padding([.leading,.trailing], 15)
                    .padding(.top, 15)
           
            }.padding()
            .background(rounded().fill(Color.white))
            .padding(.top,-50)
            
        }
    }
}

struct rounded : Shape {
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 35, height: 35))
        
        return Path(path.cgPath)
    }
}

struct type : Identifiable{
    var id : Int
    var rows : [row]
    
}

struct row : Identifiable {
    var id :  Int
    var name : String
    var price : String
    var image : String
    var desc : String
}

var sizes = ["S", "M", "X", "XL"]
var types = ["Redcap", "Escalar", "Panda", "Blue"]
var datas = [
    
    
    type(id:0,rows: [row(id:0,name: "Half Black", price: "Q35.00", image: "oranda1", desc: "Bonito Ejemplar con jiba color naranja y cuerpo color negro"),
                     row(id:1,name: "Otro nombre", price: "Q50.00", image: "oranda2", desc: "Bonito Ejemplar para dar color a tu acuario." )]),
    
    type(id:1,rows: [row(id:0,name: "Full Black", price: "Q55.00", image: "black", desc: "Escalares color Negro completo, para adornar tu acuario completamente y dar una vista extraordinaria."),
                     row(id:1,name: "Half Black", price: "Q80.00", image: "white", desc: "Escalar totalmente blanco, para disuadir el acuario y dar una excelente vista.")])
]













