export enum FontSize {
  SMALL = 14,
  MIDDLE = 16,
  LARGE = 20,
}

export enum FontWeight {
  BOLD = '400',
  BOLDER = '500',
}

export const WEIGHT = '100%'

export const TIME = 1000

export const APP_EXIT_INTERVAL: number = 4500

export const TAG: string = 'RankPage'

export const TITLE: Resource = $r('app.string.title')

class style {
  RANK_PADDING: number = 15;
  CONTENT_WIDTH: string = '90%';
  BORDER_RADIUS: number = 20;
  STROKE_WIDTH: number = 1;
  HEADER_MARGIN_TOP: number = 20;
  HEADER_MARGIN_BOTTOM: number = 15;
  LIST_HEIGHT: string = '65%';
}

export const Style: style = {
  RANK_PADDING: 15,
  CONTENT_WIDTH: '90%',
  BORDER_RADIUS: 20,
  STROKE_WIDTH: 1,
  HEADER_MARGIN_TOP: 20,
  HEADER_MARGIN_BOTTOM: 15,
  LIST_HEIGHT: '65%',
}

class listHeaderStyle {
  FONT_WEIGHT: number = 400;
  LAYOUT_WEIGHT_LEFT: string = "30%";
  LAYOUT_WEIGHT_CENTER: string = "50%";
  LAYOUT_WEIGHT_RIGHT: string = "20%";
}

export const ListHeaderStyle: listHeaderStyle = {
  FONT_WEIGHT: 400,
  LAYOUT_WEIGHT_LEFT: "30%",
  LAYOUT_WEIGHT_CENTER: "50%",
  LAYOUT_WEIGHT_RIGHT: "20%",
}

class itemStyle {
  TEXT_LAYOUT_SIZE: number = 24;
  CIRCLE_TEXT_BORDER_RADIUS: number = 24;
  CIRCLE_TEXT_SIZE: number = 24;
  CIRCLE_TEXT_COLOR_STOP_1: number = 0.5;
  CIRCLE_TEXT_COLOR_STOP_2: number = 1.0;
  BAR_HEIGHT: number = 48;
  LAYOUT_WEIGHT_LEFT: string = "20%";
  LAYOUT_WEIGHT_CENTER: string = '20%';
  LAYOUT_WEIGHT_RIGHT: string = '20%';
  BORDER_WIDTH: number = 1;
  COLOR_BLUE: Resource = $r('app.color.item_color');
  COLOR_BLACK: Resource = $r('app.color.item_color_black');
}

export const ItemStyle: itemStyle = {
  TEXT_LAYOUT_SIZE: 24,
  CIRCLE_TEXT_BORDER_RADIUS: 24,
  CIRCLE_TEXT_SIZE: 24,
  CIRCLE_TEXT_COLOR_STOP_1: 0.5,
  CIRCLE_TEXT_COLOR_STOP_2: 1.0,
  BAR_HEIGHT: 48,
  LAYOUT_WEIGHT_LEFT: "20%",
  LAYOUT_WEIGHT_CENTER: '20%',
  LAYOUT_WEIGHT_RIGHT: '20%',
  BORDER_WIDTH: 1,
  COLOR_BLUE: $r('app.color.item_color'),
  COLOR_BLACK: $r('app.color.item_color_black')
}

class titleBarStyle {
  IMAGE_BACK_SIZE: number = 21;
  IMAGE_BACK_MARGIN_RIGHT: number = 18;
  IMAGE_LOADING_SIZE: number = 22;
  BAR_HEIGHT: number = 47;
  BAR_MARGIN_HORIZONTAL: number = 26;
  BAR_MARGIN_TOP: number = 10;
  WEIGHT: string = '50%';
}

/**
 * The Style of TitleComponent.
 */
export const TitleBarStyle: titleBarStyle = {
  /**
   * The image size of back button.
   */
  IMAGE_BACK_SIZE: 21,

  /**
   * The right margin of back button.
   */
  IMAGE_BACK_MARGIN_RIGHT: 18,

  /**
   * The size of loading image.
   */
  IMAGE_LOADING_SIZE: 22,

  /**
   * The height of TitleComponent.
   */
  BAR_HEIGHT: 47,

  /**
   * The horizontal margin of TitleComponent.
   */
  BAR_MARGIN_HORIZONTAL: 26,

  /**
   * The top margin of TitleComponent.
   */
  BAR_MARGIN_TOP: 10,

  /**
   * The weight of Row layout.
   */
  WEIGHT: '50%',
};




















