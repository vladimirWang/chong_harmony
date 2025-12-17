import { Author } from "../include/Article";

@ComponentV2
export struct AuthorRow{
  @Require @Param data: Author;
  build() {
    Row() {
      Image(this.data.avatar).width(px2vp(100)).height(px2vp(100)).borderRadius('50%')
        .margin({right: px2vp(10)})
      Text(this.data.name).fontColor(Color.Gray).fontSize(16)
    }.width('100%').justifyContent(FlexAlign.Start)
  }
}