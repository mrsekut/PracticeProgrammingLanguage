import AuthorIterator from './iterator';
import { Author } from './index.d';

export default class AuthorListSimpleIterator implements AuthorIterator {
  private authors: Author[];
  private index = 0;

  constructor(authors: Author[]) {
    this.authors = authors;
  }

  public hasNext() {
    return this.index < this.authors.length;
  }

  public next() {
    return this.authors[this.index++];
  }
}
