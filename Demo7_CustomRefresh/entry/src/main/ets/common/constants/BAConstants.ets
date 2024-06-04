import display from '@ohos.display'
import BAAnimationModel from '../../viewmodel/BAAnimationModel'
import BADemoListItemModel from '../../viewmodel/BADemoListItemModel'
import BATarbarModel from '../../viewmodel/BATabbarModel'
import { SwiperVideoItem } from '../../viewmodel/SwiperVideoItem'
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
  static readonly Default_Tabbar_SelectedIndex = 0
  static readonly TabbarData = [
    new BATarbarModel('首页', $r('app.media.ic_tab_main_default'), $r('app.media.ic_tab_main_select')),
    new BATarbarModel('文件', $r('app.media.ic_tab_file_default'), $r('app.media.ic_tab_file_select')),
    new BATarbarModel('云存', $r('app.media.ic_tab_cloud_default'), $r('app.media.ic_tab_cloud_select')),
    new BATarbarModel('备份', $r('app.media.ic_tab_copy_default'), $r('app.media.ic_tab_copy_select')),
    new BATarbarModel('我的', $r('app.media.ic_tab_mine_default'), $r('app.media.ic_tab_mine_select'))
  ]

  static readonly tutorialSampleList: Array<BADemoListItemModel> = [
    new BADemoListItemModel('1', $r('app.media.tutorial_pic1'), 'Step1 环境的搭建', '本篇教程实现了快速入门——一个用于了解和学习HarmonyOS的应用程序。', 'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    new BADemoListItemModel('2', $r('app.media.tutorial_pic2'), 'Step2 使用Swiper构建运营广告位', 'Swiper组件提供滑动轮播显示的能力。Swiper本身是一个容器组件，当设置了多个子组件后，可以对这些子组件进行轮播显示。', 'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    new BADemoListItemModel('3', $r('app.media.tutorial_pic3'), 'Step3 创建和组合视图', 'Item定义子组件相关特征。相关组件支持使用条件渲染、循环渲染、懒加载等方式生成子组件。', 'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    new BADemoListItemModel('4', $r('app.media.tutorial_pic4'), 'Step4 网格和列表组建的使用', '网格和列表组件中，当Item达到一定数量，内容超过屏幕大小时，可以自动提供滚动功能，适合用于呈现同类数据类型或数据类型集', 'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    new BADemoListItemModel('5', $r('app.media.tutorial_pic5'), 'Step5 应用架构设计基础', 'ArkUI采取MVVM = Model + View + ViewModel模式，将数据与视图绑定在一起，更新数据的时候直接更新视图。', 'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    new BADemoListItemModel('6', $r('app.media.tutorial_pic6'), 'Step6 ArkWeb页面适配', 'ArkWeb（方舟Web）提供了Web组件，用于在应用程序中显示Web页面内容，为开发者提供页面加载、页面交互、页面调试等能力。', 'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    new BADemoListItemModel('7', $r('app.media.tutorial_pic7'), 'Step7 数据驱动UI更新', '数据更新的同时会直接驱动UI的改变', 'xxx'),
    new BADemoListItemModel('8', $r('app.media.tutorial_pic8'), 'Step8 设置组件导航', 'Navigation组件适用于模块内页面切换，一次开发，多端部署场景。通过组件级路由能力实现更加自然流畅的转场体验，并提供多种标题栏样式来呈现更好的标题和内容联动效果。', 'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    new BADemoListItemModel('9', $r('app.media.tutorial_pic8'), 'Step9 原生智能：AI语音朗读', '文本转语音服务提供将文本信息转换为语音并进行播报的能力，便于用户与设备进行互动，实现实时语音交互，文本播报。', 'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    new BADemoListItemModel('10', $r('app.media.tutorial_pic8'), 'Step10 原生互联：分布式流转', '流转能力打破设备界限，多设备联动，使用户应用程序可分可合、可流转，实现如邮件跨设备编辑、多设备协同健身、多屏游戏等分布式业务。', 'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    new BADemoListItemModel('11', $r('app.media.tutorial_pic8'), 'Step11 一次开发，多端部署', '一套代码工程，一次开发上架，多端按需部署。支撑开发者快速高效的开发支持多种终端设备形态的应用，实现对不同设备兼容的同时，提供跨设备的流转、迁移和协同的分布式体验。', 'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
  ]

}

export const SECOND_PAGE: string = "pages/BAWebIndex"

export const enum STRING_PERCENT {
  SLIDER_WITH = '46.7%',
  NINETY_PERCENT = '88%',
  INDEX_COMPONENT_WIDTH_PERCENT = '95.3%',
  INDEX_SWIPER_HEIGHT_PERCENT = '24.1%',
  INDEX_MODULE_HEIGHT_PERCENT = '22.8%',
  INDEX_SWIPER_LEFT_RIGHT_MARGIN = '3.3%'
}

export const enum MARGIN_FONT_SIZE {
  FIRST_MARGIN = 12,
  SECOND_MARGIN = 16,
  THIRD_MARGIN = 18,
  FOURTH_MARGIN = 24,
  FIFTH_MARGIN = 50,
  SIXTH_MARGIN = 94,
  SEVENTH_MARGIN = 132
}

export const SWIPER_Imgs: SwiperVideoItem[] = [
  new SwiperVideoItem($r('app.media.banner_pic1')),
  new SwiperVideoItem($r('app.media.banner_pic2')),
  new SwiperVideoItem($r('app.media.banner_pic3')),
  new SwiperVideoItem($r('app.media.banner_pic4')),
  new SwiperVideoItem($r('app.media.banner_pic5'))
]