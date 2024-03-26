import hilog from '@ohos.hilog'

class BALogger {
  private domain: number
  private prefix: string
  private format: string = '%{public}s, %{public}s'

  constructor(domain: number = 0xFF00, prefix: string = 'Demo') {
    this.domain = domain
    this.prefix = prefix
  }

  debug(...args: string[]): void {
    hilog.debug(this.domain, this.prefix, this.format, args)
  }

  info(...args: string[]): void {
    hilog.info(this.domain, this.prefix, this.format, args)
  }

  warn(...args: string[]): void {
    hilog.warn(this.domain, this.prefix, this.format, args)
  }

  error(...args: string[]): void {
    hilog.error(this.domain, this.prefix, this.format, args)
  }
}

export default new BALogger(0xFF00, 'Demo6')

