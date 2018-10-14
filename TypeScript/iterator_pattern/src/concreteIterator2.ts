import AuthorIterator from './iterator';

// これ消してgenericにする? 今のAuthorSimpleみたいに
type AuthorDetailed = {
  familyName: string;
  givenName: string;
  id: number;
};

export default class AuthorListDetailedIterator implements AuthorIterator {
  protected authors: AuthorDetailed[]; // TODO:protected???
  private position = 0;

  constructor(authors: AuthorDetailed[]) {
    this.authors = authors;
  }

  public hasNext() {
    return this.position < this.authors.length;
  }

  public next(): string {
    //   最適化
    const author = this.authors[this.position++];
    const familyNmae = author.familyName;
    const givenName = author.givenName;

    return `${familyNmae}-${givenName}`;
  }
}
