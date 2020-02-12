//
//  BonusLabel.swift
//  EsoArmoury
//
//  Created by walnut on 10/9/19.
//  Copyright © 2019 walnut. All rights reserved.
//

import SwiftUI

class BonusView: UIView {
    private var label = UITextView()
    var shouldSetupConstraints = false
    override init(frame: CGRect) {
        super.init(frame: frame)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        //label.isScrollEnabled = false
        
        //label.backgroundColor = UIColor.purple
        self.addSubview(label)
        //self.sizeToFit()
        //label.sizeToFit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func updateConstraints() {
        if(shouldSetupConstraints) {
          // AutoLayout constraints
          shouldSetupConstraints = false
        }
        super.updateConstraints()
    }
    
    func setNSString(_ attributedString:NSAttributedString) {
        self.label.attributedText = attributedString
    }
}

struct BonusLabel: UIViewRepresentable {
    
    
    typealias UIViewType = UITextView
    var text:NSAttributedString
    
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        //let textViewHeight = NSLayoutConstraint.self
        let placeholderLabel = UILabel()
        
        textView.font = UIFont(name: "Helvetica", size: 16)
        placeholderLabel.restorationIdentifier = "Placeholder"
        placeholderLabel.attributedText = text
        placeholderLabel.font = UIFont.italicSystemFont(ofSize: (textView.font?.pointSize)!)
        placeholderLabel.lineBreakMode = .byWordWrapping
        placeholderLabel.numberOfLines = 0
        placeholderLabel.frame.size.height = 25
        
        
        //placeholderLabel.adjustsFontSizeToFitWidth = true
        //placeholderLabel.isScrollEnabled = false
        //placeholderLabel.translatesAutoresizingMaskIntoConstraints = true
        //placeholderLabel.isScrollEn
        //placeholderLabel.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        //placeholder.
        //textView.safeAreaLayoutGuide = initFrame
        
        
        //textView.lineBreakMode = NSLineBreakMode.byWordWrapping
        //textView.number
        
        //textView.translatesAutoresizingMaskIntoConstraints = true
        
        
        
        //textView.addSubview(placeholderLabel)
        textView.translatesAutoresizingMaskIntoConstraints = false
        //textView.sizeToFit()
        textView.isScrollEnabled = true
        //textView.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        //textView.backgroundColor = UIColor.green
        //textViewHeight.constant = self.textView.contentSize.height
//        textView.updateConstraintsIfNeeded()
        //textView.systemLayoutSizeFitting(CGSize)
        //textView.backgroundColor = UIColor.green
        //textView.scaledToFill()
        //textView.sizeToFit()
        return textView
        
    }
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<BonusLabel>) {
        uiView.attributedText = text
        
        //uiView.textContainer.lineBreakMode = NSLineBreakMode.byWordWrapping
        //uiView.number
        //uiView.translatesAutoresizingMaskIntoConstraints = true
        //uiView.isScrollEnabled = false
        //uiView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        uiView.translatesAutoresizingMaskIntoConstraints = true
        uiView.sizeToFit()
        
        //uiView.isScrollEnabled = false
        uiView.updateConstraintsIfNeeded()
        //uiView.frame(minWidth: 0,  maxWidth:.infinity, minHeight: 0,  maxHeight: .infinity)
        
        
        
        
        
        //uiView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        //uiView.autoresizesSubviews = true
    }
    
    func textViewDidChange(_ textView: UITextView) {
          let fixedWidth = textView.frame.size.width
          textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
          let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
          var newFrame = textView.frame
          newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
          textView.frame = newFrame
        textView.backgroundColor = UIColor.green
    }
    
//    func makeUIView(context: Context) -> BonusView {
//        let view = BonusView()
//        view.setNSString(text)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }
    
   // func updateUIView(_ uiView: BonusView, context: UIViewRepresentableContext<BonusLabel>) {
        //uiView .text = self.text
        //uiView.translatesAutoresizingMaskIntoConstraints = true
        //uiView.backgroundColor = UIColor.purple
        //uiView.sizeToFit()
    
}


struct BonusText: UIViewRepresentable {
    var text: NSAttributedString
//    let root = ArmorDetail(armor: armorData[163])
//    let viewCtrl = UIHostingController(rootView: root)
    
    func makeUIView(context: UIViewRepresentableContext<BonusText>) -> UITextView {
            let v = UITextView()
            v.translatesAutoresizingMaskIntoConstraints = false
           return v
        }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.attributedText = text
        //uiView.sizeToFit()
     }
}

#if DEBUG
struct BonusLabel_Previews: PreviewProvider {
    static var previews: some View {
        BonusLabel(text: NSAttributedString(string: "When you deal damage, you have a 10% chance to call a murder of crows around you for 12 seconds. Every 3 seconds a crow will be sent to peck the closest enemy within 12 meters of you, dealing 4000 Physical Damage. This effect can occur once every 15 seconds."))
    }
}
#endif
