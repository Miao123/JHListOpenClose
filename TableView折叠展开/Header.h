//
//  Header.h
//  TableView折叠展开
//
//  Created by 苗建浩 on 2017/6/24.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

#ifndef Header_h
#define Header_h

//屏幕的宽度
#define screenWidth  [UIScreen mainScreen].bounds.size.width
#define screenHight  [UIScreen mainScreen].bounds.size.height

#define DISTENCEW (([UIScreen mainScreen].bounds.size.width) / 320)
#define DISTENCEH (([UIScreen mainScreen].bounds.size.height) / 568)

/*状态栏高度*/

#define STATUS_HEIGHT 20

/*导航栏高度*/

#define NAVGATION_HEIGHT 44

/*状态栏加导航栏高度*/

#define NAVGATION_ADD_STATUS_HEIGHT (STATUS_HEIGHT + NAVGATION_HEIGHT)


/* tabbar 高度*/
#define TABBAR_HEIGHT 49

#endif /* Header_h */
