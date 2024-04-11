import BAConstants from '../common/constants/BAConstants'
import { BARefreshConstants, BARefreshHeaderStyle, BARefreshState } from '../common/constants/BARefreshConstants'
import BARefreshAnimateHeader from './BARefreshAnimateHeader'
import BARefreshDefaultHeader from './BARefreshDefaultHeader'

@Component
export default struct BARefreshComponent {
  private listController: Scroller = new Scroller()
  private displayHeight: number = 0
  private onRefresh?: () => void
  private headerStyle: BARefreshHeaderStyle = BARefreshHeaderStyle.DEFAULT
  @State headerOffset: number = 0
  @Consume(BARefreshConstants.REFRESH_STATE_TAG) @Watch('onStateChanged') state: number
  @BuilderParam itemLayout?: () => void

  private onStateChanged() {
    switch (this.state) {
      case BARefreshState.REFRESHING:
        if (this.onRefresh !== undefined) {
          this.onRefresh()
        }
        break;
      case BARefreshState.COMPLETE:
        this.headerOffset = -BARefreshConstants.REFRESH_HEADER_HEIGHT
        break;

      default:
        break;
    }
  }

  aboutToAppear() {
    if (this.state === BARefreshState.REFRESHING) {
      this.headerOffset = 0
      this.onStateChanged()
    } else {
      this.state = BARefreshState.IDLE
      this.headerOffset = -BARefreshConstants.REFRESH_HEADER_HEIGHT
    }
    this.displayHeight = BARefreshConstants.REFRESH_HEADER_HEIGHT + Number(this.displayHeight)
  }

  build() {
    List({ scroller: this.listController }) {
      ListItem() {
        Column() {
          if (this.headerStyle === BARefreshHeaderStyle.DEFAULT) {
            BARefreshDefaultHeader()
              .height(BARefreshConstants.REFRESH_HEADER_HEIGHT)
          } else if (this.headerStyle === BARefreshHeaderStyle.CLOUD) {
            BARefreshAnimateHeader()
              .height(BARefreshConstants.REFRESH_HEADER_HEIGHT)
          }
          if (this.itemLayout !== undefined) {
            this.itemLayout()
          }
        }
        .width(BAConstants.Full_Length)
        .height(Number(this.displayHeight) + BARefreshConstants.REFRESH_LAYOUT_EXTRA_HEIGHT)
      }
    }
    .edgeEffect(EdgeEffect.Spring)
    .width(BAConstants.Full_Length)
    .height(this.displayHeight)
    .listDirection(Axis.Vertical)
    .offset({
      y: this.headerOffset
    })
    .animation({
      curve: Curve.Smooth,
      duration: BARefreshConstants.REFRESH_HEADER_ANIMATION_DURATION,
      playMode: PlayMode.Normal,
      onFinish: () => {
        if (this.headerOffset === -BARefreshConstants.REFRESH_HEADER_HEIGHT) {
          this.state = BARefreshState.IDLE
        }
      }
    })
    .onTouch((event?: TouchEvent) => {
      if (!event) {
        return
      }
      switch (event.type) {
        case TouchType.Down:
          if (this.state === BARefreshState.IDLE) {
            this.state = BARefreshState.DRAGGING
          }
          break;
        case TouchType.Move:
          if (this.state === BARefreshState.DRAGGING && this.listController.currentOffset()
            .yOffset <= -BARefreshConstants.REFRESH_EFFECTIVE_HEIGHT) {
            this.state = BARefreshState.DRAGGING_REFRESHABLE
          }
          break;
        case TouchType.Up:
          if (this.state === BARefreshState.DRAGGING_REFRESHABLE) {
            this.headerOffset = 0
            this.state = BARefreshState.REFRESHING
          }
          break;
        default:
          break;
      }
    })

  }
}