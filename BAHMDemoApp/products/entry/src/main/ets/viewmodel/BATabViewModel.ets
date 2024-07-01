import BATabBarItem from './BATabBarItem';

export class BATabViewModel {
  static getTabData(): Array<BATabBarItem> {
    return [
      new BATabBarItem('微信', $r('app.media.icon_wx_tab_wx'), $r('app.media.icon_wx_tab_wx_select')),
      new BATabBarItem('通讯录', $r('app.media.icon_wx_tab_connect'), $r('app.media.icon_wx_tab_connect_select')),
      new BATabBarItem('发现', $r('app.media.icon_wx_tab_find'), $r('app.media.icon_wx_tab_find_select')),
      new BATabBarItem('我的', $r('app.media.icon_wx_tab_mine'), $r('app.media.icon_wx_tab_mine_select')),
    ]
  }
}