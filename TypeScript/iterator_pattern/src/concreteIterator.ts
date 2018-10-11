import AuthorIterator from './iterator';

export default class AuthorListSimpleIterator<T> implements AuthorIterator {
  private authors: T[];
  private position = 0;

  constructor(authors: T[]) {
    this.authors = authors;
  }

  public hasNext() {
    return this.position < this.authors.length;
  }

  public next(): Object {
    return this.authors[this.position++];
  }
}
