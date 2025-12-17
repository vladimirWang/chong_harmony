@ObservedV2
export class Author{
  readonly id: number;
  @Trace
  name: string;
  @Trace
  avatar: ResourceStr;
  constructor(id: number, name: string, avatar: ResourceStr = $rawfile('jordan.png')) {
    this.id = id;
    this.name = name;
    this.avatar = avatar;
  }
}

@ObservedV2
export class Article {
  readonly id: number;
  @Trace
  publishAt: Date;
  @Trace
  content: string;
  @Trace
  title: string;
  @Trace
  author: Author;
  constructor(id: number, publishAt: Date, content:string, title:string, author: Author) {
    this.id = id;
    this.publishAt = publishAt
    this.content = content;
    this.title = title;
    this.author = author;
  }
}