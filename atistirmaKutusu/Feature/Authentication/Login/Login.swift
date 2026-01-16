//
//  Login.swift
//  atistirmaKutusu
//
//  Created by tuğba berk on 15.01.2026.
//

import SwiftUI

struct Login: View {
    var body: some View {
        VStack {
            Spacer()

            ImagesItems.Authentication.login.rawValue.image()
            Text(LocalKeys.Login.welcomeBack.rawValue.local())
                .font(.system(size: FontSize.loginTitle, weight: .semibold))
                .foregroundColor(.teflon)
            HtextEmailIconField(
                
                hint: LocalKeys.General.EmailHint.rawValue.local(),
                iconName: IconItems.IconAsset.email.rawValue
            )

            HtextpasswordIconField(
                hint: LocalKeys.General.PasswordHint.rawValue.local(),
                iconName: IconItems.IconAsset.lock.rawValue
            ).padding(.top,PagePadding.All.normalPadding.rawValue)

            Divider()
            normalButton(onTap: {}, title: LocalKeys.Login.Createaccount.rawValue)
                .padding(.top,PagePadding.All.normalPadding.rawValue)
            
           
            Text(LocalKeys.Login.TermsAndCondition.rawValue.local())
                .padding(.top,PagePadding.All.normalPadding.rawValue)
                .font(.system(size: FontSize.caption1, weight: .regular))
                .foregroundColor(.Gandaf)
                .tint(.CornFlowerBlue)
            
                .environment(\.openURL, OpenURLAction(handler:{
                    url in print(url)
                    return .discarded
                }))
            Spacer()
        }.padding(.all,PagePadding.All.normalPadding.rawValue)
    }
}
#Preview {
    Login()
}

private struct HtextEmailIconField: View {
    let hint: LocalizedStringKey
    let iconName: String
    var body: some View {
        HStack{
            iconName.image()
            TextField(hint, text: .constant(""))
        }.modifier(TextFieldModifer())
    }
}

private struct HtextpasswordIconField: View {
    let hint: LocalizedStringKey
    let iconName: String
    var body: some View {
        HStack{
            iconName.image()
            SecureField(hint, text: .constant(""))
        }.modifier(TextFieldModifer())
    }
}
