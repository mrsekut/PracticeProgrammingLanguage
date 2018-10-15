export default class AuthorListMethods<T> {
  constructor(public authorList: T[]) {}

  addToList(author: T) {
    this.authorList.push(author);
  }

  getAuthorList() {
    return this.authorList;
  }
}
