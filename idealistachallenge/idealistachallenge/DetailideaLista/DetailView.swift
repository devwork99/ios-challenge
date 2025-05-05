//
//  DetailView.swift
//  idealistachallenge
//
//  Created by Muhammad Yasir on 10/03/2025.
//

import SwiftUI
//import SDWebImageSwiftUI
import SDWebImageSwiftUI
import UIKit

struct DetailView: View {
    
    @State private var propDesc = "this is the full description of the property addded here, this is the full description of the property addded here, this is the full description of the property addded here, this is the full description of the property addded here."
    
    var body: some View {
        
        ScrollView{
            
            
            VStack(spacing:15.0){
                
                //header image
                ZStack {
                    WebImage(url:URL(string:"https://img4.idealista.com/blur/WEB_DETAIL-L-L/0/id.pro.es.image.master/58/60/32/1273036727.webp")!)
                        .resizable()
                        .frame(width:UIScreen.main.bounds.width, height:UIScreen.main.bounds.height*0.4)
                    
                    
                    Text("1/24")
                        .foregroundStyle(.white)
                        .background(.black)
                        .font(Font(UIFont.systemFont(ofSize:12)))
                        .padding()
                        .frame(maxWidth:.infinity, maxHeight:60, alignment:.bottomTrailing)
                }
                
                
                
                //3 buttons
                VStack(alignment:.leading, spacing:15.0){
                   
                    //buttons Gallery & Map
                    HStack(spacing:15.0){
                        
                        //gallery
                        Button {
                            
                        } label: {
                            
                            Image(uiImage:UIImage(systemName:"photo.stack")!.withTintColor(UIColor(named:"ListGalleryBtnColor")!, renderingMode:.alwaysOriginal))
                                .resizable()
                                .frame(width:50, height:50)
                                .padding()
                                .border(.black, width: 1.5)
                                .cornerRadius(2.5)
                        }
                        
                        //map
                        Button {
                            
                        } label: {
                            
                            Image(uiImage:UIImage(systemName:"mappin.circle")!.withTintColor(UIColor(named:"ListGalleryBtnColor")!, renderingMode:.alwaysOriginal))
                                .resizable()
                                .frame(width:50, height:50)
                                .padding()
                                .border(.black, width: 1.5)
                                .cornerRadius(2.5)
                        }
                        
                        // video
                        Button {
                            
                        } label: {
                            
                            Image(uiImage:UIImage(systemName:"video.square")!.withTintColor(UIColor(named:"ListGalleryBtnColor")!, renderingMode:.alwaysOriginal))
                                .resizable()
                                .frame(width:50, height:50)
                                .padding()
                                .border(.black, width: 1.5)
                                .cornerRadius(2.5)
                        }
                        
                    }
                    
                    Text("Flat in Vila Real")
                        .font(Font(UIFont.boldSystemFont(ofSize:18)))
                    
                    Text("Vila Real")
                        .font(Font(UIFont.systemFont(ofSize:18)))
                    
                    Text("1000 $/month")
                        .font(Font(UIFont.boldSystemFont(ofSize:18)))
                    
                    HStack{
                        
                        Text("1 bed")
                        
                        Text("74 total m2")
                        
                        Text("3rd floor")
                        
                        Text("with lift")
                    }
                    
                }
                
                
                //3 buttons
                HStack(spacing:50){
                    
                    //buttos save
                    VStack{
                        Button {
                        } label: {
                            
                            VStack(spacing:15){
                                Image(uiImage:UIImage(systemName:"heart")!
                                    .withTintColor(UIColor(named:"ListCellLowerIconsColor")!, renderingMode:.alwaysOriginal))
                                    .resizable()
                                    .frame(width:30, height:30)
                                
                                Text("Save")
                                    .font(Font(UIFont.boldSystemFont(ofSize: 20)))
                                    .foregroundColor(Color("ListCellLowerIconsColor"))
                            }
                        }
                    }
                    
                    
                    //buttos discard
                    VStack{
                        Button {
                            
                        } label: {
                            
                            VStack(spacing:15){
                                Image(uiImage:UIImage(systemName:"trash")!
                                    .withTintColor(UIColor(named:"ListCellLowerIconsColor")!, renderingMode:.alwaysOriginal))
                                    .resizable()
                                    .frame(width:30, height:30)
                                
                                Text("Discard")
                                    .font(Font(UIFont.boldSystemFont(ofSize: 20)))
                                    .foregroundColor(Color("ListCellLowerIconsColor"))
                            }
                        }
                    }
                    
                    //buttos share
                    VStack{
                        Button {
                            
                        } label: {
                            
                            VStack(spacing:15){
                                Image(uiImage:UIImage(systemName:"square.and.arrow.up")!
                                    .withTintColor(UIColor(named:"ListCellLowerIconsColor")!, renderingMode:.alwaysOriginal))
                                    .resizable()
                                    .frame(width:30, height:30)
                                
                                Text("Share")
                                    .font(Font(UIFont.boldSystemFont(ofSize: 20)))
                                    .foregroundColor(Color("ListCellLowerIconsColor"))
                            }
                        }
                    }
                    
                }
                
                //notes section
                ZStack(alignment:.leading){
                    
                    Rectangle()
                        //.fill(Color("ListCellLowerIconsColor"))
                        .fill(.gray)
                        .frame(width:UIScreen.main.bounds.width * 0.8, height:60.0)
                        .background(.red)
                    
                    Button {
                        
                    } label: {
                        HStack{
                            Image(systemName:"doc.text.fill")
                                .frame(width:30.0, height:50)
                                //.background(.red)
                                //.foregroundColor(Color("ListCellLowerIconsColor"))
                            
                            Text("Add your note")
                                //.foregroundColor(Color("ListPostDateColor"))
                                .font(Font(UIFont.systemFont(ofSize:16)))
                        }
                        
                    }

                    
                }
                
                
                VStack(alignment:.leading, spacing:15){
                    
                    Text("Advertiser comment")
                        .font(Font(UIFont.boldSystemFont(ofSize:20)))
                        .foregroundColor(Color("ListCostPerMonth"))
                    
                    Text("\($propDesc)")
                        .font(Font(UIFont.systemFont(ofSize:16)))
                        .foregroundStyle(Color("ListCostPerMonth"))
                    
                    Button {
                        
                    } label: {
                        Text("View full comment")
                            .font(Font(UIFont.systemFont(ofSize:16)))
                            .foregroundStyle(Color("ListCellLowerIconsColor"))
                    }

                    //TextEditor(text:$propDesc)
                        //.foregroundStyle(.secondary)
                        
                    
                    
                    
                }
                
            }
            
            
            
        }
        
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
