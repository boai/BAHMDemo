import BATabBarItem from './BATabBarItem';

export class BATabViewModel {
  static getTabData(): Array<BATabBarItem> {
    return [
      new BATabBarItem('首页', $r('app.media.ic_tab_main_default'), $r('app.media.ic_tab_main_select')),
      new BATabBarItem('文件', $r('app.media.ic_tab_file_default'), $r('app.media.ic_tab_file_select')),
      new BATabBarItem('云存', $r('app.media.ic_tab_cloud_default'), $r('app.media.ic_tab_cloud_select')),
      new BATabBarItem('备份', $r('app.media.ic_tab_copy_default'), $r('app.media.ic_tab_copy_select')),
      new BATabBarItem('我的', $r('app.media.ic_tab_mine_default'), $r('app.media.ic_tab_mine_select')),
    ]
  }
}