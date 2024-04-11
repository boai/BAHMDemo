
export class BARefreshConstants {
  static readonly REFRESH_STATE_TAG = 'refresh_state_tag'

  static readonly REFRESH_HEADER_HEIGHT = 50

  static readonly REFRESH_EFFECTIVE_HEIGHT = 1.2 * BARefreshConstants.REFRESH_HEADER_HEIGHT

  static readonly REFRESH_LAYOUT_EXTRA_HEIGHT = 0.1

  static readonly REFRESH_HEADER_ANIMATION_DURATION = 440
}

export enum BARefreshState {
  IDLE = 0,
  DRAGGING = 1,
  DRAGGING_REFRESHABLE = 2,
  REFRESHING = 3,
  COMPLETE = 4
}

export enum BARefreshHeaderStyle {
  DEFAULT,
  CLOUD
}

