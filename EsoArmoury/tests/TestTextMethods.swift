//
//  TestTextMethods.swift
//  SwiftUIAttributedStrings
//
import SwiftUI

class ViewWithLabel : UIView {
    private var label = UITextView()

    private var label1 = UILabel()

    override init(frame: CGRect) {
        super.init(frame:frame)
        //label.sizeToFit()
        //self.layer.cornerRadius = 30
        label.isScrollEnabled = false
        //label.tag =
        //label.sizeThatFits(CGSize(width: self.frame.width, height: self.frame.height))
        //addChildViewController(label)// self.addSubview(label)
        //label.numberOfLines = 0  // needed for UILabel
        label.sizeToFit()
        //label.textContainerInset =
        //label.layoutSubviews()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        // .flexibleWidth, .flexibleHeight]
        //
        //label.contentMode = .scaleAspectFit
        //label.sizeToFit()
        //label.frame(minHeight: label.frame.size.height)

        //label.autoresizesSubviews = true
        //label.lineBreakMode = NSLineBreakMode.byWordWrapping


        label.backgroundColor = UIColor.purple
        self.addSubview(label)
        //label.contentMode = .scaleAspectFill
            //.contentSize = CGSizeMake(label.frame.size.width, label.frame.size.height);


    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func setString(_ attributedString:NSAttributedString) {
        self.label.attributedText = attributedString
    }
}

struct TextWithAttributedString: UIViewRepresentable {
   var attributedString:NSAttributedString

//    func makeUIView(context: Context) -> UIView {
//        let view = UITextView()
//
//        return view
//    }


    func makeUIView(context: Context) -> ViewWithLabel {
        let view = ViewWithLabel()
        //view.backgroundColor = UIColor.purple
        //UIViewRepresentableContext<TextWithAttributedString>) {
        //uiView.sizeToFit()
        return view
    }

    func updateUIView(_ uiView: ViewWithLabel, context: UIViewRepresentableContext<TextWithAttributedString>) {
            uiView.setString(attributedString)
            uiView.sizeToFit()
        //uiView.backgroundColor = UIColor.purple
    }
}

struct TextWithAttributedString_Previews: PreviewProvider {
    static var previews: some View {
        TextWithAttributedString(attributedString: NSAttributedString(string: "When you deal damage, you have a 10% chance to call a murder of crows around you for 12 seconds. Every 3 seconds a crow will be sent to peck the closest enemy within 12 meters of you, dealing 4000 Physical Damage. This effect can occur once every 15 seconds."))
    }
}
