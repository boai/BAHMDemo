import { COMMON_NUM_DOUBLE, COMMON_NUM_MINUTE, SPLIT, ZERO_STR } from '../common/constants/BACommonConstants'

export function changeSliderTime(value: number): string {
  let second: number = value % COMMON_NUM_MINUTE
  let min: number = Number.parseInt((value / COMMON_NUM_MINUTE).toString())
  let head = min < COMMON_NUM_DOUBLE ? `${ZERO_STR}${min}` : min
  let end = second < COMMON_NUM_DOUBLE ? `${ZERO_STR}${second}` : second
  let nowTime = `${head}${SPLIT}${end}`
  return nowTime
}