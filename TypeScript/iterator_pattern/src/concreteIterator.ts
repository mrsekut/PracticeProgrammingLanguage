import AuthorIterator from './iterator';

export default class AuthorListSimpleIterator implements AuthorIterator {
  private authors: string[];
  private index: number;

  constructor(authors: string[]) {
    this.authors = authors;
    this.index = 0;
  }

  public hasNext() {
    return this.index < this.authors.length;
  }

  public next() {
    return this.authors[this.index++];
  }
}

// import AuthorIterator from './iterator';

// export default class AuthorListSimpleIterator<T> implements AuthorIterator {
//   private authors: T[];
//   private index = 0;

//   constructor(authors: T[]) {
//     this.authors = authors;
//   }

//   public hasNext() {
//     return this.index < this.authors.length;
//   }

//   public next() {
//     return this.authors[this.index++];
//   }
// }
