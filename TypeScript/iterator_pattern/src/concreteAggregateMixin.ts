export default class AuthorListMethods<T> {
  // public authorList: T[];

  constructor(public authorList: T[]) {
    // this.authorList = authors;
  }

  public addToList(author: T) {
    this.authorList.push(author);
  }

  public getAuthorList() {
    return this.authorList;
  }

  public oPrint() {
    console.log(this.authorList);
  }
}

// export default class AuthorListMethods {
//   constructor(public authors: any) {}

//   public oPrint() {
//     return this.authors;
//   }
// }

// export default class Container {
//   constructor(public value: number) {}

//   display() {
//     return `node: ${this.value}`;
//   }
// }
