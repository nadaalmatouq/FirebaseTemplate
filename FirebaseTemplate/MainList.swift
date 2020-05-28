//
//  MainList.swift
//  ListProject
//
//
/* problems we've faced:

*the image we want it to be a uiimage and not a string in our struct // hasan

*/
//
//

import SwiftUI

struct MainList: View {

@EnvironmentObject var env: Env
@Environment(\.presentationMode) var presentationMode
@State var isEditTravel = false // this var to make the array edit not append new one
@State var isEdit = false
@State var isEditShopping = false
@State var isEditCeleb = false
var backgroungColor = "Background"
@State var isWorkWillAdd = false
@State var isWorkWillEditT = false
@State var isWorkWillEditC = false
@State var isWorkWillEditS = false
@State var isWorkWillEdit = false   //DONT FORGET TO TOGGLE IT SO WHEN YOU COME BACK AFTER THE FIRST TIME ITS NOT ALWAYS TRUE
@State var nameList = ""
    
    @State var currentShoppingList : ShoppingList = ShoppingList(lista: Lista(givenName: "", budget: "", id: "", type: "shopping", remaining: ""), id: "", listClothesAccessories: [], listFoodVegetables: [], listElectronicDevices: [], listOthers: [])
      @State var currentLista : Lista = Lista(givenName: "", budget: "", id: "", type: "", remaining: "")
    @State var currentCelebrationList : CelebrationList = CelebrationList(
    lista: Lista(givenName: "", budget: "", id: "", type: "celebration", remaining: ""), id: ""
    , gifts: [] , decoration: [] , clothesAccessories: [] , other: [])
    @State var currentListaCelebration : Lista = Lista(givenName: "", budget: "", id: "", type: "", remaining: "")
    @State var allShoppingLists : [ShoppingList] = []
     @State var allCelebrationLists : [CelebrationList] = []
var body: some View {
NavigationView{
ZStack {
//  Color(backgroungColor)
Image("bac")
.resizable()
.scaledToFill()
.edgesIgnoringSafeArea(.all)
VStack{
ZStack{
Color(.white)
//  .opacity(0.8)
VStack(spacing: 10){
    ScrollView(.vertical){
        
        VStack{
            Text(self.env.types[0])
                .foregroundColor(Color.black)
                .bold()
                .font(.system(size:24))
            ScrollView(.horizontal){
                HStack{
                    
                    ForEach(self.env.alltravelLists, id: \.self){ i in
                        VStack{
                            
                            
                            //                                                    if (i.picture! == UIImage(systemName: "camera.circle"))
                            //
                            //                                                    {
                            //                                                        //Image(uiImage: UIImage(imageLiteralResourceName: "travelicon"))
                            //                                                        Image("travelicon")
                            //                                                            .resizable()
                            //                                                            .frame(width: 130, height: 130)
                            //                                                            .cornerRadius(10)
                            //                                                            .shadow(radius: 10)
                            //
                            //
                            //                                                    }
                            //                                                    else{
                            //                                                        Image(uiImage: i.picture!)
                            //                                                            .resizable()
                            //                                                            .frame(width: 130, height: 130)
                            //                                                            .cornerRadius(10)
                            //                                                            .shadow(radius: 10)
                            //                                                    }
                            //
                            
                            Text(i.lista.givenName)
                                .foregroundColor(Color.black)
                                .bold()
                                .font(.system(size:24))
                        }.onTapGesture {
                            self.isWorkWillEditT = true
                            self.env.currentTravelList = i
                            self.isEditTravel = true
                        }.padding(.all, 20)
                        
                        
                    }.sheet(isPresented: $isEditTravel) {
                        TravelListDetails(isEdit: self.$isEditTravel).environmentObject(self.env)
                    }
                }
            }
            
        }
        
        VStack{
            Text(self.env.types[1])
                .foregroundColor(Color.black)
                .bold()
                .font(.system(size:24))
            ScrollView(.horizontal){
                HStack{
                    ForEach(self.allCelebrationLists, id: \.self){ i in
                        VStack{
//                              if (i.picture! == UIImage(systemName: "camera.circle"))
//
//                                                      {
//                                                          //Image(uiImage: UIImage(imageLiteralResourceName: "travelicon"))
//
//                                                          ZStack{
//                                                          Image("travelicon-1")
//                                                          .resizable()
//                                                          .frame(width: 130, height: 130)
//                                                          .cornerRadius(10)
//                                                          .shadow(radius: 10)
//
//                                                              Text(i.lista.givenName)
//                                                                                             .foregroundColor(Color.white)
//                                                                                             .bold()
//                                                                                             .font(.system(size:24))
//
//
//                                                          }
//
//
//                                                      }
//                                                      else{
//
//                                                         ZStack{
//                                                  Image(uiImage: i.picture!)
//                                                      .resizable()
//                                                      .frame(width: 130, height: 130)
//                                                      .cornerRadius(10)
//                                                      .shadow(radius: 10)
//
//
//                                                          Text(i.lista.givenName)
//                                                                                                                            .foregroundColor(Color.white)
//                                                                                                                            .bold()
//                                                                                                                            .font(.system(size:24))
//
//
//                                                          }
//
//
//
//                                                  }
                            Text(i.lista.givenName)
                            .foregroundColor(Color.black)
                            .bold()
                            .font(.system(size:24))
                        }.onTapGesture {
                            self.isWorkWillEditC = true
                            self.currentCelebrationList = i
                            self.isEditCeleb = true
                        }.padding(.all, 20)
                    }.sheet(isPresented: $isEditCeleb) {
                        celebrationDetailsList(isEdit: self.$isEditCeleb, currentCelebrationList: self.$currentCelebrationList, currentLista: self.$currentListaCelebration).environmentObject(self.env)
                    }
                }
            }
        }
        VStack{
            
            Text(self.env.types[2])
                .foregroundColor(Color.black)
                .bold()
                .font(.system(size:24))
            ScrollView(.horizontal){
                HStack{
                    ForEach(self.allShoppingLists, id: \.self){ i in
                        VStack{
                            
//                            if (i.picture! == UIImage(systemName: "camera.circle"))
//                                
//                            {
//                                //Image(uiImage: UIImage(imageLiteralResourceName: "travelicon"))
//                                Image("shoppingicon")
//                                    .resizable()
//                                    .frame(width: 130, height: 130)
//                                    .cornerRadius(10)
//                                    .shadow(radius: 10)
//                                
//                                
//                            }
//                            else{
//                                
//                                Image(uiImage: i.picture!)
//                                    .resizable()
//                                    .frame(width: 130, height: 130)
//                                    .cornerRadius(10)
//                                    .shadow(radius: 10)
//                                }
                            Text(i.lista.givenName)
                            .foregroundColor(Color.black)
                            .bold()
                            .font(.system(size:24))
                        }
                        .onTapGesture {
                            self.isWorkWillEditS = true
                            self.currentShoppingList = i
                            self.isEditShopping = true
                        }.padding(.all, 20)
                    }.sheet(isPresented: $isEditShopping) {
                        ShoppingListDetail(isEdit: self.$isEditShopping, currentShoppingList: self.$currentShoppingList, currentLista: self.$currentLista).environmentObject(self.env)
                    }
                }
            }
        }
    }
    
    }
.padding(.vertical)
    .padding(.horizontal, 60)
}
    NavigationLink(destination: CreateNewList(isEdit: $isEdit, currentShoppingList: $currentShoppingList, currentLista: $currentLista, currentCelebrationList: $currentCelebrationList).environmentObject(self.env), isActive:
self.$env.taskDone2){
HStack{
    Image(systemName: "plus").imageScale(.large)
        .font(.system(size: 20))
        .foregroundColor(Color(.white))
        .frame(width: 60, height: 60)
        .background(Color("blue"))
        .clipShape(Circle())
        
        .padding(.vertical,10)
        .shadow(radius: 10)
}
}//.isDetailLink(self.env.taskDone)
//.onTapGesture {
//    self.env.taskDone2.toggle()
//}
}
    }
.navigationBarTitle(Text("My Lists"))
.colorMultiply(Color(backgroungColor))
    .onAppear {
        self.GetAll3Posts()
    self.env.sheetT = false
    self.env.sheetC = false
    self.env.sheetS = false
    }
}
}
    func GetAll3Posts (){
        GetAllCelebrationPosts()
        GetAllShoppingPosts()
    }
        func GetAllShoppingPosts()  {
         
            Networking.getListOf(COLLECTION_NAME: "Shopping", success: { (shoppingList: [ShoppingList]) in
                self.allShoppingLists = shoppingList
               // print("Shopping post = ", self.allShoppingLists)
              //  print(self.env.allShoppingLists)
            }) { (error) in
                print("Error!", error)
            }
        }
   
    func GetAllCelebrationPosts()  {

        Networking.getListOf(COLLECTION_NAME: "Celebration", success: { (celebrationList: [CelebrationList]) in
            self.allCelebrationLists = celebrationList
           // print("Shopping post = ", self.allCelebrationLists)
          //  print(self.env.allShoppingLists)
        }) { (error) in
            print("Error!", error)
        }
    }

}

//struct MainList_Previews: PreviewProvider {
//static var previews: some View {
//MainList().environmentObject(Env())
//}
//}
