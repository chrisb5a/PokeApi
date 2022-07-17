

import UIKit


    
    
extension UIView {
    func bindToSuperView(insets: UIEdgeInsets = UIEdgeInsets(top: 8 , left: 8, bottom: 8, right: 8)){
        
        guard let superSafe = self.superview?.safeAreaLayoutGuide else{
            fatalError("Fix Hierarchy")
        }
        
        self.topAnchor.constraint(equalTo: superSafe.topAnchor, constant: insets.top).isActive = true
        self.leadingAnchor.constraint(equalTo: superSafe.leadingAnchor, constant: insets.top).isActive = true
        self.trailingAnchor.constraint(equalTo: superSafe.trailingAnchor, constant: -insets.top).isActive = true
        self.bottomAnchor.constraint(equalTo: superSafe.bottomAnchor, constant: -insets.top).isActive = true
    }
}
