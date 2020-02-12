//
//  HighlightText.swift
//  EsoArmoury
//
//  Created by walnut on 1/10/20.
//  Copyright © 2020 walnut. All rights reserved.
//

import SwiftUI

public struct TextStyle {
    internal let key: NSAttributedString.Key
    internal let apply: (Text) -> Text
    
    private init(key: NSAttributedString.Key, apply: @escaping (Text) -> Text) {
        self.key = key
        self.apply = apply
    }
}

public extension TextStyle {
    static func foregroundColor(_ color: Color) -> TextStyle {
        TextStyle(key: .init("TextStyleForegroundColor"), apply: { $0.foregroundColor(color) })
    }
    
    static func bold() -> TextStyle {
        TextStyle(key: .init("TextStyleBold"), apply: { $0.bold() })
    }
}

public struct StyledText {
    private var  attributedString: NSAttributedString
    
    private init(attributedString: NSAttributedString) {
        self.attributedString = attributedString
    }
    
    public func styles<S>(_ style: TextStyle, ranges: (String) -> S) -> StyledText
        where S: Sequence, S.Element == Range<String.Index>
    {
        let newAttributedString = NSMutableAttributedString(attributedString: attributedString)
        for range in ranges(attributedString.string) {
            let nsRange = NSRange(range, in: attributedString.string)
            newAttributedString.addAttribute(style.key, value: style, range: nsRange)
        }
        return StyledText(attributedString: newAttributedString)
    }
}

public extension StyledText {
    func style(_ style: TextStyle, range: (String) -> Range<String.Index> = { $0.startIndex..<$0.endIndex }) -> StyledText {
        self.styles(style, ranges: { [range($0)] })
    }
}

extension StyledText {
    public init(verbatim content: String, styles: [TextStyle] = []) {
        let attributes = styles.reduce(into: [:]) { result, style in
            result[style.key] = style
        }
        attributedString = NSMutableAttributedString(string: content, attributes: attributes)
    }
}
extension StyledText: View {
    public var body: some View { text() }
    
    public func text() -> Text {
        var text: Text = Text(verbatim: "")
        attributedString.enumerateAttributes(in: NSRange(location: 0, length: attributedString.length), options: []) {
            (attributes, range, _) in
            let string = attributedString.attributedSubstring(from: range).string
            let modifiers = attributes.values.map { $0 as! TextStyle }
            text = text + modifiers.reduce(Text(verbatim: string)) { segment, style in
                style.apply(segment)
            }
        }
        return text
    }
}

extension TextStyle {
    static func stamina() -> TextStyle { .foregroundColor(Color("textStamina")) }
    static func magica() -> TextStyle { .foregroundColor(Color("textMagica")) }
    static func health() -> TextStyle { .foregroundColor(Color("textHealth")) }
    static func gold() -> TextStyle { .foregroundColor(Color("textSpecial")) }
}


struct Highlight: View {
    var text : String
    
    var body: some View {
        StyledText(verbatim: text)
            //STAMINA
            .styles(.stamina(), ranges: { [$0.range(of: "Stamina") ?? $0.range(of: " ")!] })
            .styles(.stamina(), ranges: { [$0.range(of: "Maximum Stamina") ?? $0.range(of: " ")!] })
            .styles(.stamina(), ranges: { [$0.range(of: "Max Stamina") ?? $0.range(of: " ")!] })
            .styles(.stamina(), ranges: { [$0.range(of: "Stamina Recovery") ?? $0.range(of: " ")!] })
            .styles(.stamina(), ranges: { [$0.range(of: "Weapon Damage") ?? $0.range(of: " ")!] })
            .styles(.stamina(), ranges: { [$0.range(of: "Weapon Critical") ?? $0.range(of: " ")!] })
            //MAGICKA
            .styles(.magica(), ranges: { [$0.range(of: "Magicka") ?? $0.range(of: " ")!] })
            .styles(.magica(), ranges: { [$0.range(of: "Maximum Magicka") ?? $0.range(of: " ")!] })
            .styles(.magica(), ranges: { [$0.range(of: "Max Magicka") ?? $0.range(of: " ")!] })
            .styles(.magica(), ranges: { [$0.range(of: "Magicka Recovery") ?? $0.range(of: " ")!] })
            .styles(.magica(), ranges: { [$0.range(of: "Spell Damage") ?? $0.range(of: " ")!] })
            .styles(.magica(), ranges: { [$0.range(of: "Spell Critical") ?? $0.range(of: " ")!] })
            //HEALTH
            .styles(.health(), ranges:{ [$0.range(of: "Health") ?? $0.range(of: " ")!] })
            .styles(.health(), ranges:{ [$0.range(of: "Maximum Health") ?? $0.range(of: " ")!] })
            .styles(.health(), ranges:{ [$0.range(of: "Max Health") ?? $0.range(of: " ")!] })
            .styles(.health(), ranges:{ [$0.range(of: "Health Recovery") ?? $0.range(of: " ")!] })
            .styles(.health(), ranges:{ [$0.range(of: "Spell Penetration") ?? $0.range(of: " ")!] })
            .styles(.health(), ranges:{ [$0.range(of: "Physical Penetration") ?? $0.range(of: " ")!] })
            .styles(.health(), ranges:{ [$0.range(of: "Spell Resistance") ?? $0.range(of: " ")!] })
            .styles(.health(), ranges:{ [$0.range(of: "Physical Resistance") ?? $0.range(of: " ")!] })
            .styles(.health(), ranges:{ [$0.range(of: "Healing Done") ?? $0.range(of: " ")!] })
            .styles(.health(), ranges:{ [$0.range(of: "Healing Taken") ?? $0.range(of: " ")!] })
            //SPECIALS
            
            .styles(.gold(), ranges:{ [$0.range(of: "Minor Aegis") ?? $0.range(of: " ")!] })
            .styles(.gold(), ranges:{ [$0.range(of: "Minor Slayer") ?? $0.range(of: " ")!] })
            .styles(.gold(), ranges:{ [$0.range(of: "Minor Force") ?? $0.range(of: " ")!] })
            .styles(.gold(), ranges:{ [$0.range(of: "Minor Courage") ?? $0.range(of: " ")!] })
            .styles(.gold(), ranges:{ [$0.range(of: "Minor Expedition") ?? $0.range(of: " ")!] })
            .styles(.gold(), ranges:{ [$0.range(of: "Minor Evasion") ?? $0.range(of: " ")!] })
            .styles(.gold(), ranges:{ [$0.range(of: "Major Aegis") ?? $0.range(of: " ")!] })
            .styles(.gold(), ranges:{ [$0.range(of: "Major Slayer") ?? $0.range(of: " ")!] })
            .styles(.gold(), ranges:{ [$0.range(of: "Major Force") ?? $0.range(of: " ")!] })
            .styles(.gold(), ranges:{ [$0.range(of: "Major Courage") ?? $0.range(of: " ")!] })
            .styles(.gold(), ranges:{ [$0.range(of: "Major Expedition") ?? $0.range(of: " ")!] })
            .styles(.gold(), ranges:{ [$0.range(of: "Major Evasion") ?? $0.range(of: " ")!] })
                
        }
    }
    
    
    struct HighlightText_Previews: PreviewProvider {
        static var previews: some View {
            VStack {
                Highlight(text: "Adds 128 Stamina Recovery and Magicka Recovery")
                
                Highlight(text: "Increases your Maximum Health, Magicka, and Stamina by 1250.")
                    .font(.subheadline)
                
                Highlight(text: "While mounted you gain Major Evasion reducing damage from area attacks by 25%.  Dismounting spawns a dust cloud at your position for 12 seconds that deals 1436 Physical Damage every 1 second to enemies who stand inside it.  You and your group members inside the dust cloud gain Major Evasion. Dust cloud can be created once every 12 seconds")
                    .font(.subheadline)
                .lineLimit(nil)
            }
            
            
            //Highlight(text: "Adds 128 Health Recovery and Magica Recovery")
        }
}
