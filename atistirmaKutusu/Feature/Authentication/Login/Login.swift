//
//  Login.swift
//  atistirmaKutusu
//
//  Created by tuğba berk on 15.01.2026.
//

import SwiftUI

struct Login: View {
    // loginViewModeli login ekranına bağladık
    @ObservedObject private var LoginViewModel = loginViewModel()
    
    
    var body: some View {
        // bu sayfayı navigation view ile sarmaladık
        NavigationView {
            VStack {
                Spacer()
                Text(LoginViewModel.token)
                
                ImagesItems.Authentication.login.rawValue.image()
                Text(LocalKeys.Login.welcomeBack.rawValue.local())
                    .font(.system(size: FontSize.loginTitle, weight: .semibold))
                    .foregroundColor(.teflon)
                HtextEmailIconField(
                    
                    hint: LocalKeys.General.EmailHint.rawValue.local(),
                    iconName: IconItems.IconAsset.email.rawValue,
                    
                    //$ → emailValue’yu Binding’e çevirir
                    //LoginViewModel içindeki emailValue güncellenir
                    
                    text: $LoginViewModel.emailValue
                )
                
                HtextpasswordIconField(
                    hint: LocalKeys.General.PasswordHint.rawValue.local(),
                    iconName: IconItems.IconAsset.lock.rawValue,
                    text: $LoginViewModel.passwordValue
                ).padding(.top,PagePadding.All.normalPadding.rawValue)
                
                Divider()
                
                // BAŞKA BİR SAYFAYA GİTMEK İÇİN LİNK VERİYORUZ
                NavigationLink("", isActive: $LoginViewModel.loggedIn){
                    Text("HELLO").navigationBarBackButtonHidden(true)
                }
                
                
                
                
                Group{
                    normalButton(onTap: {Task{ await LoginViewModel.onLoginUser() }}, title: LocalKeys.Login.Createaccount.rawValue)
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
                }
                Spacer()
            }.padding(.all,PagePadding.All.normalPadding.rawValue)
        }.modifier(viewStatusHiddenModifier())
    }
}


#Preview {
    Login()
}

private struct HtextEmailIconField: View {
    let hint: LocalizedStringKey
    let iconName: String
// Bu email değeri dışarıdan (binding / parametre olarak) alınacaktır
    var text: Binding<String>
    
    var body: some View {
        HStack{
            iconName.image()
            TextField(hint, text: text)
        }.modifier(TextFieldModifer())
    }
}




private struct HtextpasswordIconField: View {
    let hint: LocalizedStringKey
    let iconName: String
    var text: Binding<String>
    var body: some View {
        HStack{
            iconName.image()
            SecureField(hint, text: text)
        }.modifier(TextFieldModifer())
    }
}
