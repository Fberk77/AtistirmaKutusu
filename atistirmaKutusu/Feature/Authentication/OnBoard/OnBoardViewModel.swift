import SwiftUI
// SwiftUI framework’ünü projeye dahil eder

class OnBoardViewModel: ObservableObject {
    // ObservableObject:
    // Bu class içindeki değişikliklerin SwiftUI View’lar tarafından dinlenmesini sağlar
 
    @Published public var currentIndex: Int = 0
    // @Published:
    // currentIndex değiştiğinde UI otomatik olarak güncellenir
    // Onboarding sayfalarında aktif sayfa index’ini tutar

    @Published public var isHomeRedirect: Bool = false
    // Kullanıcı onboarding’i bitirdi mi bilgisini tutar
    // true olursa ana sayfaya yönlendirme yapılır

    private let cache = UserDefaultCach()
    // UserDefaults ile veri saklamak için kullanılan yardımcı class
    // private olduğu için sadece bu ViewModel içinde erişilebilir

    private func isUserFirstLogin() -> Bool {
        // Kullanıcının uygulamayı ilk kez açıp açmadığını kontrol eder
        
        return cache.read(key: .onboard).isEmpty
        // Eğer onboard anahtarı UserDefaults içinde boşsa
        // → kullanıcı ilk kez giriş yapıyordur
    }

    func chekUserFirstTime() {
        // Uygulama açıldığında çağrılır
        // Kullanıcının ilk giriş olup olmadığını kontrol eder

        guard !isUserFirstLogin() else {
            // Eğer kullanıcı ilk kez giriş yapıyorsa
            updateCacherFirstLogin()
            // UserDefaults’a onboard bilgisi kaydedilir
            return
        }

        redirectToHome()
        // Kullanıcı daha önce giriş yapmışsa
        // direkt ana sayfaya yönlendirilir
    }

    private func updateCacherFirstLogin() {
        // Kullanıcının onboarding’i gördüğünü UserDefaults’a kaydeder
        
        cache.save(value: UserCacheKeys.dummyValue, key: .onboard)
        // onboard key’i altına dummy bir değer yazar
    }

    func saveUserloginAndRedirect() {
        // Kullanıcı onboarding’i tamamladığında çağrılır
        
        updateCacherFirstLogin()
        // onboarding tamamlandı bilgisi kaydedilir
        
        redirectToHome()
        // ana sayfaya yönlendirme tetiklenir
    }

    private func redirectToHome() {
        // Ana sayfaya yönlendirme kontrolünü sağlar
        
        isHomeRedirect = true
        // @Published olduğu için UI bu değişikliği fark eder
        // ve navigation / redirect işlemi yapılır
    }
}

class OnBoardSayfaGecis: ObservableObject { public func count() -> Int{ OnBordeModel.items.count - 1 } }
