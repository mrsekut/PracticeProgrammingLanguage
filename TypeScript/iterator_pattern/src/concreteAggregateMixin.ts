export default class AuthorListMethods<T> {
  constructor(public authorList: T[]) {}

  public addToList(author: T) {
    this.authorList.push(author);
  }

  public getAuthorList() {
    return this.authorList;
  }
}
