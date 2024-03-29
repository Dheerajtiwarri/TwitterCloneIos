//
//  CustomInputFields.swift
//  TwitterClone
//
//  Created by Dheeraj Tiwari on 27/06/22.
//

import SwiftUI

struct CustomInputFields: View {
    let imageName: String
    let placeHolderText: String
    var isSecureField: Bool? = false
    @Binding var text: String
    var body: some View {
        VStack{
            HStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                if isSecureField ?? false {
                    SecureField(placeHolderText,text: $text)
                }else {
                    TextField(placeHolderText,text: $text)
                }
                
                
            }
            
            Divider()
                .background(Color(.darkGray))
        }
    }
}

struct CustomInputFields_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputFields(imageName: "enveloper",
                          placeHolderText: "Email",
                          isSecureField: false,
                          text: .constant(""))
    }
}
