import AuthorList from './aggreagate';
import AuthorListSimpleIterator from './concreteIterator';
import AuthorListMethods from './concreteAggregateMixin';
import { Author } from './index.d';

export default class AuthorSimple extends AuthorListMethods<Author>
  implements AuthorList {
  addToList!: (author: Author) => void;
  getAuthorList!: () => Author[];

  constructor(public authorList: Author[]) {
    super(authorList);
  }

  public createIterator() {
    return new AuthorListSimpleIterator(this.authorList);
  }
}
