import display from '@ohos.display'
import BAAnimationModel from '../../viewmodel/BAAnimationModel'
import BATarbarModel from '../../viewmodel/BATabbarModel'
import { BAGlobalContext } from '../utils/BAGlobalContext'

let deviceDisplay: display.Display = BAGlobalContext.getContext().getObject('display') as display.Display

export default class BAConstants {
  static readonly REFRESH_DEFAULT_TIMEOUT = 6000
  static readonly REFRESH_HEADER_ITEM_DEFAULT_WIDTH = 30
  static readonly REFRESH_HEADER_ITEM_SCALE_WIDTH = 80
  static readonly REFRESH_HEADER_ITEM_ANIMATE_DURATION = 2000
  static readonly REFRESH_HEADER_ITEM_ANIMATE_TEMPO = 3.0
  static readonly REFRESH_HEADER_ITEM_ANIMATE_ITERATIONS = -1

  static readonly RERRESH_HEADER_FEATURE: BAAnimationModel[] = [
    new BAAnimationModel($r('app.media.ic_loading_game'), (px2vp(deviceDisplay.width) / 2 - BAConstants.REFRESH_HEADER_ITEM_DEFAULT_WIDTH / 2) - 100, 400),
    new BAAnimationModel($r('app.media.ic_loading_heart'), (px2vp(deviceDisplay.width) / 2 - BAConstants.REFRESH_HEADER_ITEM_DEFAULT_WIDTH / 2) - 50, 800),
    new BAAnimationModel($r('app.media.ic_loading_louder'), (px2vp(deviceDisplay.width) / 2 - BAConstants.REFRESH_HEADER_ITEM_DEFAULT_WIDTH / 2) - 0, 1200),
    new BAAnimationModel($r('app.media.ic_loading_bag'), (px2vp(deviceDisplay.width) / 2 - BAConstants.REFRESH_HEADER_ITEM_DEFAULT_WIDTH / 2) + 50, 1600),
    new BAAnimationModel($r('app.media.ic_loading_file'), (px2vp(deviceDisplay.width) / 2 - BAConstants.REFRESH_HEADER_ITEM_DEFAULT_WIDTH / 2) + 100, 2000),
  ]

  static readonly FILE_MANAGER_Z_INDEX = 1;
  static readonly Full_Length = '100%'
  static readonly Default_Tabbar_SelectedIndex = 1
  static readonly TabbarData = [
    new BATarbarModel('首页', $r('app.media.ic_tab_main_default'), $r('app.media.ic_tab_main_select')),
    new BATarbarModel('文件', $r('app.media.ic_tab_file_default'), $r('app.media.ic_tab_file_select')),
    new BATarbarModel('云存', $r('app.media.ic_tab_cloud_default'), $r('app.media.ic_tab_cloud_select')),
    new BATarbarModel('备份', $r('app.media.ic_tab_copy_default'), $r('app.media.ic_tab_copy_select')),
    new BATarbarModel('我的', $r('app.media.ic_tab_mine_default'), $r('app.media.ic_tab_mine_select'))
  ]
}
