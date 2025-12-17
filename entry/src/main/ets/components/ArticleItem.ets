import { Article } from "../include/Article";
import { AuthorRow } from "./AuthorRow";

@ComponentV2
export struct ArticleItem {
  @Require @Param data: Article;
  build() {
    Column({space: px2vp(20)}) {
      Text(this.data.title).fontSize(18).fontWeight(600).width('100%').textAlign(TextAlign.Start)
      AuthorRow({data: this.data.author})
      Row({space: px2vp(10)}) {
        // Text('id: ' + this.data.id)
        Text(this.data.content).maxLines(2).textOverflow({overflow: TextOverflow.Ellipsis})
      }
    }.backgroundColor(Color.White).padding(px2vp(10))
    // .padding(px2vp(20))
  }
}
















