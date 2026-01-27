//
//  loginViewModel.swift
//  atistirmaKutusu
//
//  Created by tuğba berk on 22.01.2026.
//

import Foundation

// final kullanımı  loginViewModel birdaha türetilmesini sağladık
final class loginViewModel: ObservableObject {
    
    //@Published değişken değiştirildiğinde login ekranına haber verdirmesini sağladık
    
    @Published var emailValue: String = "eve.holt@reqres.in"
    @Published var passwordValue: String = "cityslicka"
  // Kullanıcın  giriş yaptıktan sonra Backend gelen tokunu kullanrarak login ekranı güncelememi için
    @Published var token: String = ""
    
    
    
    // uygulama ilk açıldığında kullanıcı henüz giriş yapmamıştır.
    // Bu yüzden varsayılan (initial) değer olarak false atanır.
    @Published var loggedIn: Bool = false
    
    // NetworkManager initializer’ına config parametresi gönderiliyor
    let networkManager = NetworkManager(config: NetworkConfig(
        
        // NetworkConfig içindeki baseUrl ayarlanıyor
        // Bu baseUrl, hangi API’ye istek atılacağını belirler
        baseUrl:  NetworkPath.baseUrlReqres))
       // NetworkPath.baseUrlReqres → "https://reqres.in/"
       // Yani bu NetworkManager tüm istekleri reqres API’ye atacak
    
    
    func onLoginUser() async {
        token = await onLoginUser(email: emailValue, password: passwordValue)
        loggedIn = !token.isEmpty 
        // token boş ise kullanıcı giriş yapamayacağı için yönledirme olmaz true olmaz
        // false eşit ise token vardır demek
    }
    

}


extension loginViewModel: LoginUserCase {
    func onLoginUser(email: String, password: String) async -> String {
        guard !email.isEmpty else { return "" }
        guard !password.isEmpty else { return "" }
        
        // kullanıcının email ve şifresini API’ye gönderip, dönen cevabı almak.
           let response = await networkManager.post(path: .login, model: loginRequest(email: email, password: password), type: loginResponse.self)
        
     return response?.token ?? "ERROR"
        // respons nil değilse token alınır
        // token nil ise erişmeye çalışmaz opsiyonel sayesinde tokun yerine error atanır ugulma çokmez
    }
    
    func onSevaUserToken(token: String) -> Bool {
        return true
    }
    
}

protocol LoginUserCase {
    func onLoginUser(email: String, password: String) async -> String
    func onSevaUserToken(token: String) -> Bool
}

