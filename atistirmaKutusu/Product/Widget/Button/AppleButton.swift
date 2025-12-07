
import SwiftUI


struct AppleButton: View {
    

    var onTap: () -> Void
    
    var body: some View {
        Button {
          
            onTap()
        } label: {
         
            HStack {
                
            
                Image(IconItems.Social.apple.rawValue)
                
             
                Text(LocalKeys.Auth.apple.rawValue.local())
                    
                Spacer()
            }
            .tint(.white)
            .font(.title2)
            .padding(.all, PagePadding.All.normalPadding.rawValue)
        }
        .buttonBorderShape(.roundedRectangle)
        .controlSize(.large)
        .background(Color.black)
        .cornerRadius(RadiusItems.radius)
    }
}

#Preview {
  
    AppleButton(onTap: {})
}
