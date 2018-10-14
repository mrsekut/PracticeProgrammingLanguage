import AuthorList from './aggreagate';
import AuthorListSimpleIterator from './concreteIterator';

export default class AuthorSimple implements AuthorList {
  public authorList: string[];

  constructor(authors: string[]) {
    this.authorList = authors;
  }

  public addToList(author: string) {
    this.authorList.push(author);
  }

  public getAuthorList() {
    return this.authorList;
  }

  public createIterator() {
    return new AuthorListSimpleIterator(this.authorList);
  }
}

// import AuthorList from './aggreagate';
// import AuthorListSimpleIterator from './concreteIterator';

// export default class AuthorSimple<T> implements AuthorList {
//   public authorList: T[];

//   constructor(authors: T[]) {
//     this.authorList = authors;
//   }

//   public addToList(author: T) {
//     this.authorList.push(author);
//   }

//   public getAuthorList() {
//     return this.authorList;
//   }

//   public createIterator() {
//     return new AuthorListSimpleIterator(this.authorList);
//   }
// }
