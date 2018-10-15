import AuthorList from './aggreagate';
import AuthorListDetailedIterator from './concreteIterator2';
import AuthorListMethods from './concreteAggregateMixin';

// // これ消してgenericにする? 今のAuthorSimpleみたいに
type AuthorDetailedList = {
  familyName: string;
  givenName: string;
  id: number;
};

export default class AuthorsDetailed extends AuthorListMethods<
  AuthorDetailedList
> {
  oPrint!: () => void;
  constructor(public authorList: AuthorDetailedList[]) {
    super(authorList);
  }

  //   constructor(authors: AuthorDetailedList[]) {
  //     this.authorList = authors;
  //   }

  //   public addToList(author: AuthorDetailedList) {
  //     this.authorList.push(author);
  //   }

  //   public getAuthorList() {
  //     return this.authorList;
  //   }

  public createIterator() {
    return new AuthorListDetailedIterator(this.authorList);
  }
}

// export default class AuthorsDetailed extends AuthorListMethods {
//   oPrint!: () => void;
//   constructor(public authors: any) {
//     super(authors);
//   }
// }

// import Container from './concreteAggregateMixin';
// export default class AuthorsDetailed implements Container {
//   constructor(public c: Container) {}

//   get value(): number {
//     return this.c.value;
//   }

//   set value(value: number) {
//     if (value < 0) {
//       throw new Error(`${value} is not positive.`);
//     }
//     this.c.value = value;
//   }

//   display() {
//     return this.c.display();
//   }
// }
