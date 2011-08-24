//
//  FixWidthText.m
//  LayoutImageInText
//
//  Created by Haoxiang on 6/14/11.
//  Copyright 2011 DEV. All rights reserved.
//

#import "FixWidthText.h"

@implementation FixWidthText

- (id)init {
    if (self = [super init])
    {
        originSymStr = @" !\"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~";
        fixedWidthSymStr = @"　！＂＃＄％＆＇（）＊＋，－．／：；＜＝＞？＠［＼］＾＿｀｛｜｝～";
//        originSymStr = @" !\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
//        fixedWidthSymStr = @"　！＂＃＄％＆＇（）＊＋，－．／０１２３４５６７８９：；＜＝＞？＠ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ［＼］＾＿｀ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ｛｜｝～";
//        @@hchars = ' !"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~'  
//        @@fchars = '　！＂＃＄％＆＇（）＊＋，－．／０１２３４５６７８９：；＜＝＞？＠ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ［＼］＾＿｀ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ｛｜｝～'  
//        @@hhash = {' '=>'　','!'=>'！','"'=>'＂','#'=>'＃','$'=>'＄','%'=>'％','&'=>'＆','\''=>'＇','('=>'（',')'=>'）','*'=>'＊','+'=>'＋',','=>'，','-'=>'－','.'=>'．','/'=>'／','0'=>'０','1'=>'１','2'=>'２','3'=>'３','4'=>'４','5'=>'５','6'=>'６','7'=>'７','8'=>'８','9'=>'９',':'=>'：',';'=>'；','<'=>'＜','='=>'＝','>'=>'＞','?'=>'？','@'=>'＠','A'=>'Ａ','B'=>'Ｂ','C'=>'Ｃ','D'=>'Ｄ','E'=>'Ｅ','F'=>'Ｆ','G'=>'Ｇ','H'=>'Ｈ','I'=>'Ｉ','J'=>'Ｊ','K'=>'Ｋ','L'=>'Ｌ','M'=>'Ｍ','N'=>'Ｎ','O'=>'Ｏ','P'=>'Ｐ','Q'=>'Ｑ','R'=>'Ｒ','S'=>'Ｓ','T'=>'Ｔ','U'=>'Ｕ','V'=>'Ｖ','W'=>'Ｗ','X'=>'Ｘ','Y'=>'Ｙ','Z'=>'Ｚ','['=>'［','\\'=>'＼',']'=>'］','^'=>'＾','_'=>'＿','`'=>'｀','a'=>'ａ','b'=>'ｂ','c'=>'ｃ','d'=>'ｄ','e'=>'ｅ','f'=>'ｆ','g'=>'ｇ','h'=>'ｈ','i'=>'ｉ','j'=>'ｊ','k'=>'ｋ','l'=>'ｌ','m'=>'ｍ','n'=>'ｎ','o'=>'ｏ','p'=>'ｐ','q'=>'ｑ','r'=>'ｒ','s'=>'ｓ','t'=>'ｔ','u'=>'ｕ','v'=>'ｖ','w'=>'ｗ','x'=>'ｘ','y'=>'ｙ','z'=>'ｚ','{'=>'｛','|'=>'｜','}'=>'｝','~'=>'～',}  
//        @@fhash = {'　'=>' ','！'=>'!','＂'=>'"','＃'=>'#','＄'=>'$','％'=>'%','＆'=>'&','＇'=>'\'','（'=>'(','）'=>')','＊'=>'*','＋'=>'+','，'=>',','－'=>'-','．'=>'.','／'=>'/','０'=>'0','１'=>'1','２'=>'2','３'=>'3','４'=>'4','５'=>'5','６'=>'6','７'=>'7','８'=>'8','９'=>'9','：'=>':','；'=>';','＜'=>'<','＝'=>'=','＞'=>'>','？'=>'?','＠'=>'@','Ａ'=>'A','Ｂ'=>'B','Ｃ'=>'C','Ｄ'=>'D','Ｅ'=>'E','Ｆ'=>'F','Ｇ'=>'G','Ｈ'=>'H','Ｉ'=>'I','Ｊ'=>'J','Ｋ'=>'K','Ｌ'=>'L','Ｍ'=>'M','Ｎ'=>'N','Ｏ'=>'O','Ｐ'=>'P','Ｑ'=>'Q','Ｒ'=>'R','Ｓ'=>'S','Ｔ'=>'T','Ｕ'=>'U','Ｖ'=>'V','Ｗ'=>'W','Ｘ'=>'X','Ｙ'=>'Y','Ｚ'=>'Z','［'=>'[','＼'=>'\\','］'=>']','＾'=>'^','＿'=>'_','｀'=>'`','ａ'=>'a','ｂ'=>'b','ｃ'=>'c','ｄ'=>'d','ｅ'=>'e','ｆ'=>'f','ｇ'=>'g','ｈ'=>'h','ｉ'=>'i','ｊ'=>'j','ｋ'=>'k','ｌ'=>'l','ｍ'=>'m','ｎ'=>'n','ｏ'=>'o','ｐ'=>'p','ｑ'=>'q','ｒ'=>'r','ｓ'=>'s','ｔ'=>'t','ｕ'=>'u','ｖ'=>'v','ｗ'=>'w','ｘ'=>'x','ｙ'=>'y','ｚ'=>'z','｛'=>'{','｜'=>'|','｝'=>'}','～'=>'~',}          
    }
    return self;
}

- (void)dealloc {
    [originSymStr release];
    [fixedWidthSymStr release];
    [super dealloc];
}

- (NSString *)textWithFixedWidth:(NSString *)originText {

    NSAssert([originSymStr length] == [fixedWidthSymStr length], @"textWithFixedWidth");
    
    NSMutableString *orgText = [NSMutableString stringWithString:originText];
    
    for (int i = 0; i < [originSymStr length]; i++)
    {
        NSString *orgSym = [originSymStr substringWithRange:NSMakeRange(i, 1)];
        NSString *repSym = [fixedWidthSymStr substringWithRange:NSMakeRange(i, 1)];
        NSLog(@"\'%@\' -> \'%@\'", orgSym, repSym);
        [orgText setString:[orgText stringByReplacingOccurrencesOfString:orgSym
                                                              withString:repSym]];
    }
    
    NSLog(@"%@", orgText);
    
    return orgText;
}

@end
