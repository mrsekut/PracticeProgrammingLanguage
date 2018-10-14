import AuthorIterator from './iterator';

export default class AuthorListSimpleIterator<T> implements AuthorIterator<T> {
  private authors: T[];
  private index = 0;

  constructor(authors: T[]) {
    this.authors = authors;
  }

  public hasNext() {
    return this.index < this.authors.length;
  }

  public next() {
    return this.authors[this.index++];
  }
}
