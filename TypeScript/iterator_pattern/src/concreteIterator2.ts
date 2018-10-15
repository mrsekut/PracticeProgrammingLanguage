import AuthorIterator from './iterator';

// これ消してgenericにする? 今のAuthorSimpleみたいに
type AuthorDetailedList = {
  familyName: string;
  givenName: string;
  id: number;
};

export default class AuthorListDetailedIterator implements AuthorIterator {
  protected authors: AuthorDetailedList[]; // TODO:protected???
  private position = 0;

  constructor(authors: AuthorDetailedList[]) {
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
