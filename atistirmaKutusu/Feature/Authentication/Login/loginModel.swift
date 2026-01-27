//
//  loginModel.swift
//  atistirmaKutusu
//
//  Created by tuğba berk on 23.01.2026.
//

import Foundation

//Codable
//JSON’a çevrilebilmesini (encode)
//JSON’dan okunabilmesini (decode) sağlar
struct loginRequest: Encodable {
    let email: String //API’ye gönderilecek email bilgisi
    let password: String
}

struct loginResponse: Codable {
    let token: String
    
    //Kullanıcı başarıyla giriş yaptığında
    //Backend sana genelde bir token döner
    //Bu struct, o gelen JSON’u Swift modeline çevirmek için kullanılır
}
