
import {BACommonConstants} from '../constants/BACommonConstants'

export default function getCurrentTime(): string {
  let date = new Date()
  let year = date.getFullYear()
  let month = date.getMonth() + BACommonConstants.PLUS_ONE
  let day = date.getDate()
  let hours = date.getHours()
  let minutes = date.getMinutes().toString()
  let second = date.getSeconds().toString()

  if (Number.parseInt(minutes) < BACommonConstants.TEN) {
    minutes = `0${minutes}`
  }

  if (Number.parseInt(second) < BACommonConstants.TEN) {
    second = `0${second}`
  }

  let time = `${year}-${month}-${day} ${hours}:${minutes}:${second}`
  return time
}

