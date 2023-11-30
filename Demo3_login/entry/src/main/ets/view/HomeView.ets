import CommonConstats from '../common/CommonConstats'
import HomeViewModel from '../viewmodel/HomeViewModel'
import ItemData from '../viewmodel/ItemData'

@Component
export default struct HomeView {
  private swiperController: SwiperController = new SwiperController()

  build() {
    Scroll() {

      Column({ space: CommonConstats.COMMON_SPACE }) {
        Column() {
          Text($r('app.string.mainPage_tabTitles_home'))
            .fontWeight(FontWeight.Medium)
            .fontSize($r('app.float.page_title_text_size'))
            .margin({ top: $r('app.float.mainPage_tabTitles_margin') })
            .padding({ left: $r('app.float.mainPage_tabTitles_padding') })
        }
        .width(CommonConstats.FULL_PARENT)
        .alignItems(HorizontalAlign.Start)

        Swiper(this.swiperController) {
          ForEach(HomeViewModel.getSwiperImages(), (img: Resource) => {
            Image(img).borderRadius($r('app.float.home_swiper_borderRadius'))
          }, (img: Resource) => JSON.stringify(img.id))
        }
        .margin({ top: $r('app.float.home_swiper_margin') })
        .autoPlay(true)

        Grid() {
          ForEach(HomeViewModel.getFirstGridData(), (item: ItemData) => {
            GridItem() {
              Column() {
                Image(item.img)
                  .width($r('app.float.home_homeCell_size'))
                  .height($r('app.float.home_homeCell_size'))
                Text(item.title)
                  .fontSize($r('app.float.little_text_size'))
                  .margin({ top: $r('app.float.home_homeCell_margin') })
              }
            }
          }, (item: ItemData) => JSON.stringify(item))
        }
        .columnsTemplate('1fr 1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr')
        .columnsGap($r('app.float.home_grid_columnsGap'))
        .rowsGap($r('app.float.home_grid_rowGap'))
        .padding({ top: $r('app.float.home_grid_padding'), bottom: $r('app.float.home_grid_padding') })
        .height($r('app.float.home_grid_height'))
        .backgroundColor(Color.White)
        .borderRadius($r('app.float.home_grid_borderRadius'))

        Text($r('app.string.home_list'))
          .fontSize($r('app.float.normal_text_size'))
          .fontWeight(FontWeight.Medium)
          .width(CommonConstats.FULL_PARENT)
          .margin({ top: $r('app.float.home_text_margin') })

        Grid() {
          ForEach(HomeViewModel.getSecondGridData(), (secondItem: ItemData) => {
            GridItem() {
              Column() {
                Text(secondItem.title)
                  .fontSize($r('app.float.normal_text_size'))
                  .fontWeight(FontWeight.Medium)
                Text(secondItem.others)
                  .margin({ top: $r('app.float.home_list_margin') })
                  .fontSize($r('app.float.little_text_size'))
                  .fontColor($r('app.color.home_grid_fontColor'))
              }
              .alignItems(HorizontalAlign.Start)
            }
            .padding({ top: $r('app.float.home_list_padding'), left: $r('app.float.home_list_margin') })
            .borderRadius($r('app.float.home_backgroundImage_borderRadius'))
            .align(Alignment.TopStart)
            .backgroundImage(secondItem.img)
            .backgroundImageSize(ImageSize.Cover)
            .width(CommonConstats.FULL_PARENT)
            .height(CommonConstats.FULL_PARENT)

          }, (secondItem: ItemData) => JSON.stringify(secondItem))
        }
        .width(CommonConstats.FULL_PARENT)
        .height($r('app.float.home_secondGrid_height'))
        .columnsTemplate('1fr 1fr')
        .rowsTemplate('1fr 1fr')
        .columnsGap($r('app.float.home_grid_columnsGap'))
        .rowsGap($r('app.float.home_grid_rowGap'))
        .margin({ bottom: $r('app.float.setting_button_bottom') })
      }
    }
    .height(CommonConstats.FULL_PARENT)
  }
}