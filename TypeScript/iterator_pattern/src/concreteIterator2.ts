import AuthorIterator from './iterator';
import { AuthorDetailedList } from './index.d';

export default class AuthorListDetailedIterator implements AuthorIterator {
  protected authors: AuthorDetailedList[];
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
