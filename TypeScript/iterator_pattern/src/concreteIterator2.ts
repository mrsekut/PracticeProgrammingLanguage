import AuthorIterator from './iterator';
import { AuthorDetailedList } from './index.d';

export default class AuthorListDetailedIterator implements AuthorIterator {
  private position = 0;

  constructor(protected authors: AuthorDetailedList[]) {
    this.authors = authors;
  }

  hasNext() {
    return this.position < this.authors.length;
  }

  next() {
    const author = this.authors[this.position++];
    const familyNmae = author.familyName;
    const givenName = author.givenName;

    return `${familyNmae}-${givenName}`;
  }
}
