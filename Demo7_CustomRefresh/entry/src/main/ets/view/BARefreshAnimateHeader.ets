import BAConstants from '../common/constants/BAConstants'
import { BARefreshConstants, BARefreshState } from '../common/constants/BARefreshConstants'
import BADimensionUtil from '../common/utils/BADimensionUtil'
import BAAnimationModel from '../viewmodel/BAAnimationModel'

@Component
export default struct BARefreshAnimateHeader {
  @State iconWidth: number = BAConstants.REFRESH_HEADER_ITEM_DEFAULT_WIDTH
  @Consume(BARefreshConstants.REFRESH_STATE_TAG) @Watch('onStateCheck') state: number

  private onStateCheck() {
    if (this.state === BARefreshState.REFRESHING) {
      this.iconWidth = BAConstants.REFRESH_HEADER_ITEM_SCALE_WIDTH
    } else {
      this.iconWidth = BAConstants.REFRESH_HEADER_ITEM_DEFAULT_WIDTH
    }
  }

  @Builder BAAttrAnimationItemView(item: BAAnimationModel) {
    Image(item.imgRes)
      .width(px2vp(BADimensionUtil.adaptDimension(this.iconWidth)))
      .position({
        x: item.poxX
      })
      .objectFit(ImageFit.Contain)
      .animation({
        duration: BAConstants.REFRESH_HEADER_ITEM_ANIMATE_DURATION,
        tempo: BAConstants.REFRESH_HEADER_ITEM_ANIMATE_TEMPO,
        delay: item.delay,
        curve: Curve.Linear,
        playMode: PlayMode.Alternate,
        iterations: BAConstants.REFRESH_HEADER_ITEM_ANIMATE_ITERATIONS
      })
  }

  build() {
    Row() {
      if (this.state !== BARefreshState.IDLE) {
        ForEach(BAConstants.RERRESH_HEADER_FEATURE, (item: BAAnimationModel) => {
          this.BAAttrAnimationItemView(item)
        }, (item: BAAnimationModel) => JSON.stringify(item))
      }
    }
    .width(BAConstants.Full_Length)
    .height(BAConstants.Full_Length)
    .onAppear(() => {
      this.onStateCheck()
    })
  }
}