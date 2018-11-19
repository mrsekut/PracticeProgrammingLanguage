import AuthorIterator from './iterator';
import { Author } from './index.d';

export default class AuthorListSimpleIterator implements AuthorIterator {
  private index = 0;

  constructor(private authors: Author[]) {}

  hasNext() {
    return this.index < this.authors.length;
  }

  next() {
    return this.authors[this.index++];
  }
}
