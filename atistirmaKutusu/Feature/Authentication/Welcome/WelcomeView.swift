import SwiftUI

public enum StringItems: String {
    case focebokLogin = "Facebook İle Giriş Yap"
}


struct WelcomeView: View {
    var body: some View {
        ZStack {
           
                Image(Images.atıstırma.rawValue)
                    .resizable()
                         
            Color.black.opacity(0.3) // Karanlık katman
            BodyView()
      }
    }
}

// MARK: - İçerik Alanı
private struct BodyView: View {
    var body: some View {
        
        GeometryReader { geometry in
            
            VStack {
                Spacer()
                
                // Uygulama Logo
                Image(Icon.App_logo.rawValue)
                
                Spacer()
                
                // Sosyal giriş butonları
                facebookButton(onTap: {})
                    .padding(.top, 40)
                
                GoogleButton(onTap: {})
                    .padding(.top, 10)
                
                AppleButton(onTap: {})
                    .padding(.top, 10)
                
                // Divider
                // Çizgi görünümü (Divider) oluşturuyoruz.
                Divider()
                    
                    // Divider’ın arka plan rengini ayarlıyoruz.
                    // Burada özel bir renk olan .peace1 kullanılıyor.
                    .background(Color.peace1)
                    
                    // Divider’ın genişlik ve yüksekliğini belirliyoruz.
                    // width: Ekranın genişliğinin %60’ı olacak şekilde ayarlanıyor.
                    // height: DividerViewSize içinde tanımlanan sabit yükseklik kullanılıyor.
                    .frame(
                        width: geometry.widthProxy(width: 0.16),
                        height: DividerViewSize.Dividernormal
                    )
                    
                    // Divider’ın etrafına yatay boşluk (padding) ekliyoruz.
                    // PagePadding.Horizontal.normalHorizontal enum'undan alınan değeri kullanıyoruz.
                    .padding(.all, PagePadding.Horizontal.normalHorizontal.rawValue)

                
                // Email ile kayıt ol
                EmailButton(onTap: {})
                    .padding(.top, 10)
                
                // Alt boşluk: ekranın %20'si
                Spacer()
                    .frame(height: geometry.widthProxy(width: 0.06))
                
            }
            .padding(.paddingAll)
        }
    }
}
#Preview {
    WelcomeView().ignoresSafeArea(.all) // Safe area'yı yok sayar
        
}
