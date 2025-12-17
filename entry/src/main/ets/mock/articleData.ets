import { Article, Author } from '../include/Article'

// 文章集合
export const articles = Array.from({length: 20}, (item: undefined, index:number) => {
  return new Article(index, new Date(), '123123——fasdfasdffasdfasdffasdfasdffasdfasdf法师法师打发手动阀手动阀手打发撒123123——fasdfasdffasdfasdffasdfasdffasdfasdf法师法师打发手动阀手动阀手打发撒', '标题_'+index,
    new Author(index, '作者'+index)
  )
})