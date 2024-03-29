//
//  ProfileView.swift
//  TwitterClone
//
//  Created by Dheeraj on 22/02/22.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedFilter: TweetFliterViewModel = .tweets
    @Environment(\.presentationMode) var mode
    @Namespace var animation
    
    var body: some View {
        VStack(alignment: .leading){
            headerView
            
            actionButtons
            
            userInfoDetails
           
            tweetFilterBar
            
            tweetsView
            
        Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

extension ProfileView {
    //22nd feb 2022 : Dheeraj : view are added using extensions
    var headerView: some View{
        ZStack(alignment: .bottomLeading){
            Color(.systemBlue)
                .ignoresSafeArea()
            
            VStack{
                Button{

                    mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20,height: 16)
                        .foregroundColor(.white)
                        .offset(x: 16, y: 12)
                    
                }
                Spacer()
            }
            .padding(.leading)
          
            
      
            
            Circle()
                .frame(width: 72,height: 72)
                .offset(x: 16, y: 24)
            
        }
        .frame(height: 96)
       
    }
    
    var actionButtons: some View{
        HStack{
            Spacer()
            
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray,lineWidth: 0.75))
            
            Button{
                
            } label: {
                Text("Edit Profile")
                    .font(.subheadline).bold()
                    .frame(width: 120,height: 32)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray,lineWidth: 0.75))
                    .foregroundColor(.black)
            }
        }
        .padding(.trailing)
    }
    
    var userInfoDetails: some View{
        VStack(alignment: .leading, spacing: 4){
            HStack {
                Text("Heath Ledger")
                    .font(.title2).bold()
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            
            Text("@joker")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Your moms favorite villain")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack(spacing: 24){
                HStack{
                    Image(systemName: "mappin.and.ellipse")
                    
                    Text("Gotham, NY")
                }
                
                HStack{
                    Image(systemName: "link")
                    
                    Text("www.thejoker.com")
                    
                }
            }
            .font(.caption)
            .foregroundColor(.gray)
            
            
           UserStateView()
            .padding(.vertical)
        }
        .padding(.horizontal)
    }
    
    var tweetFilterBar: some View{
        HStack{
            ForEach(TweetFliterViewModel.allCases,id: \.rawValue){ item in
                VStack{
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold : .regular)
                        .foregroundColor(selectedFilter == item ? .black : .gray)
                    
                    if(selectedFilter == item){
                        Capsule()
                            .foregroundColor(Color(.systemBlue))
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    }else {
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 3)
                    }
                }
                .onTapGesture{
                    withAnimation(.easeInOut){
                        self.selectedFilter = item
                    }
                }
            }
        }
        .overlay(Divider().offset(x:0,y:16))
        
    }
    
    var tweetsView: some View{
        ScrollView{
            LazyVStack{
                ForEach(0 ... 9 ,id: \.self){ _ in
                    TweetRowView()
                        .padding()
                }
            }
        }
    }
}
